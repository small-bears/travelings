package com.shanzhu.tourism.controller.order;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shanzhu.tourism.domain.Result;
import com.shanzhu.tourism.domain.SysAttractionOrder;
import com.shanzhu.tourism.domain.SysAttractions;
import com.shanzhu.tourism.domain.User;
import com.shanzhu.tourism.enums.ResultCode;
import com.shanzhu.tourism.service.SysAttractionOrderService;
import com.shanzhu.tourism.service.SysAttractionsService;
import com.shanzhu.tourism.service.UserService;
import com.shanzhu.tourism.utils.TokenUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 景点预约controller
 *
 * 
 * @date: 2024-08-10
 */
@Controller
@ResponseBody
@RequestMapping("order")
public class SysAttractionOrderController {

    @Resource
    private SysAttractionOrderService sysAttractionOrderService;
    @Resource
    private UserService userService;
    @Resource
    private SysAttractionsService sysAttractionsService;

    /** 分页获取景点预约 */
    @PostMapping("getSysAttractionOrderPage")
    public Result getSysAttractionOrderPage(@RequestBody SysAttractionOrder sysAttractionOrder) {
        Page<SysAttractionOrder> page = new Page<>(sysAttractionOrder.getPageNumber(),sysAttractionOrder.getPageSize());
        QueryWrapper<SysAttractionOrder> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(StringUtils.isNotBlank(sysAttractionOrder.getAttractionsId()),SysAttractionOrder::getAttractionsId,sysAttractionOrder.getAttractionsId())
                .like(StringUtils.isNotBlank(sysAttractionOrder.getName()),SysAttractionOrder::getName,sysAttractionOrder.getName())
                .eq(StringUtils.isNotBlank(sysAttractionOrder.getIntroduce()),SysAttractionOrder::getIntroduce,sysAttractionOrder.getIntroduce())
                .eq(StringUtils.isNotBlank(sysAttractionOrder.getImages()),SysAttractionOrder::getImages,sysAttractionOrder.getImages())
                .eq(sysAttractionOrder.getNum() != null,SysAttractionOrder::getNum,sysAttractionOrder.getNum())
                .eq(sysAttractionOrder.getTime() != null,SysAttractionOrder::getTime,sysAttractionOrder.getTime())
                .eq(StringUtils.isNotBlank(sysAttractionOrder.getPeople()),SysAttractionOrder::getPeople,sysAttractionOrder.getPeople())
                .eq(sysAttractionOrder.getState() != null,SysAttractionOrder::getState,sysAttractionOrder.getState())
                .eq(StringUtils.isNotBlank(sysAttractionOrder.getUserId()),SysAttractionOrder::getUserId,sysAttractionOrder.getUserId())
                .like(StringUtils.isNotBlank(sysAttractionOrder.getCreateBy()),SysAttractionOrder::getCreateBy,sysAttractionOrder.getCreateBy())
                .eq(sysAttractionOrder.getCreateTime() != null,SysAttractionOrder::getCreateTime,sysAttractionOrder.getCreateTime())
                .eq(StringUtils.isNotBlank(sysAttractionOrder.getUpdateBy()),SysAttractionOrder::getUpdateBy,sysAttractionOrder.getUpdateBy())
                .eq(sysAttractionOrder.getUpdateTime() != null,SysAttractionOrder::getUpdateTime,sysAttractionOrder.getUpdateTime());
        Page<SysAttractionOrder> sysAttractionOrderPage = sysAttractionOrderService.page(page, queryWrapper);
        return Result.success(sysAttractionOrderPage);
    }

    /** 根据id获取景点预约 */
    @GetMapping("getSysAttractionOrderById")
    public Result getSysAttractionOrderById(@RequestParam("id")String id) {
        SysAttractionOrder sysAttractionOrder = sysAttractionOrderService.getById(id);
        return Result.success(sysAttractionOrder);
    }

    /** 保存景点预约 */
    @PostMapping("saveSysAttractionOrder")
    @Transactional(rollbackFor = Exception.class)
    public Result saveSysAttractionOrder(@RequestBody SysAttractionOrder sysAttractionOrder) {
        String userId = TokenUtils.getUserIdByToken();
        User user = userService.getById(userId);
        sysAttractionOrder.setUserId(user.getId());
        SysAttractions attractions = sysAttractionsService.getById(sysAttractionOrder.getAttractionsId());
        if (attractions.getNum() - sysAttractionOrder.getNum() < 0) {
            return Result.fail("库存不足");
        }
        attractions.setNum(attractions.getNum() - sysAttractionOrder.getNum());
        sysAttractionsService.updateById(attractions);
        sysAttractionOrder.setName(attractions.getName());
        sysAttractionOrder.setIntroduce(attractions.getIntroduce());
        sysAttractionOrder.setImages(attractions.getImages());
        boolean save = sysAttractionOrderService.save(sysAttractionOrder);
        if (save) {
            return Result.success();
        } else {
            return Result.fail(ResultCode.COMMON_DATA_OPTION_ERROR.getMessage());
        }
    }

    /** 编辑景点预约 */
    @PostMapping("editSysAttractionOrder")
    public Result editSysAttractionOrder(@RequestBody SysAttractionOrder sysAttractionOrder) {
        boolean save = sysAttractionOrderService.updateById(sysAttractionOrder);
        if (save) {
            return Result.success();
        } else {
            return Result.fail(ResultCode.COMMON_DATA_OPTION_ERROR.getMessage());
        }
    }

    /** 删除景点预约 */
    @GetMapping("removeSysAttractionOrder")
    public Result removeSysAttractionOrder(@RequestParam("ids")String ids) {
        if (StringUtils.isNotBlank(ids)) {
            String[] asList = ids.split(",");
            for (String id : asList) {
                sysAttractionOrderService.removeById(id);
            }
            return Result.success();
        } else {
            return Result.fail("景点预约id不能为空！");
        }
    }

}