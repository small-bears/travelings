package com.shanzhu.tourism.controller.hotel;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shanzhu.tourism.domain.Result;
import com.shanzhu.tourism.domain.SysHotel;
import com.shanzhu.tourism.domain.SysHotelItem;
import com.shanzhu.tourism.domain.SysHotelOrder;
import com.shanzhu.tourism.enums.ResultCode;
import com.shanzhu.tourism.service.SysHotelItemService;
import com.shanzhu.tourism.service.SysHotelOrderService;
import com.shanzhu.tourism.service.SysHotelService;
import com.shanzhu.tourism.utils.TokenUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 酒店预约controller
 *
 * 
 * @date: 2024-08-10
 */
@Controller
@ResponseBody
@RequestMapping("order")
public class SysHotelOrderController {

    @Resource
    private SysHotelOrderService sysHotelOrderService;
    @Resource
    private SysHotelService sysHotelService;
    @Resource
    private SysHotelItemService sysHotelItemService;

    /** 分页获取酒店预约 */
    @PostMapping("getSysHotelOrderPage")
    public Result getSysHotelOrderPage(@RequestBody SysHotelOrder sysHotelOrder) {
        Page<SysHotelOrder> page = new Page<>(sysHotelOrder.getPageNumber(),sysHotelOrder.getPageSize());
        QueryWrapper<SysHotelOrder> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .eq(StringUtils.isNotBlank(sysHotelOrder.getHotelId()),SysHotelOrder::getHotelId,sysHotelOrder.getHotelId())
                .like(StringUtils.isNotBlank(sysHotelOrder.getName()),SysHotelOrder::getName,sysHotelOrder.getName())
                .eq(sysHotelOrder.getState() != null,SysHotelOrder::getState,sysHotelOrder.getState())
                .eq(StringUtils.isNotBlank(sysHotelOrder.getUserId()),SysHotelOrder::getUserId,sysHotelOrder.getUserId())
                .eq(StringUtils.isNotBlank(sysHotelOrder.getItemId()),SysHotelOrder::getItemId,sysHotelOrder.getItemId())
                .like(StringUtils.isNotBlank(sysHotelOrder.getCreateBy()),SysHotelOrder::getCreateBy,sysHotelOrder.getCreateBy())
                .eq(sysHotelOrder.getCreateTime() != null,SysHotelOrder::getCreateTime,sysHotelOrder.getCreateTime());
        Page<SysHotelOrder> sysHotelOrderPage = sysHotelOrderService.page(page, queryWrapper);
        return Result.success(sysHotelOrderPage);
    }

    /** 根据id获取酒店预约 */
    @GetMapping("getSysHotelOrderById")
    public Result getSysHotelOrderById(@RequestParam("id")String id) {
        SysHotelOrder sysHotelOrder = sysHotelOrderService.getById(id);
        return Result.success(sysHotelOrder);
    }

    /** 保存酒店预约 */
    @PostMapping("saveSysHotelOrder")
    @Transactional(rollbackFor = Exception.class)
    public Result saveSysHotelOrder(@RequestBody SysHotelOrder sysHotelOrder) {
        SysHotel hotel = sysHotelService.getById(sysHotelOrder.getHotelId());
        sysHotelOrder.setName(hotel.getName());
        sysHotelOrder.setIntroduce(hotel.getIntroduce());
        sysHotelOrder.setImages(hotel.getImages());
        SysHotelItem item = sysHotelItemService.getById(sysHotelOrder.getItemId());
        if (item.getNum() - 1 < 0) {
            return Result.fail("库存不足");
        }
        item.setNum(item.getNum() - 1);
        sysHotelItemService.updateById(item);
        sysHotelOrder.setItemName(item.getName());
        sysHotelOrder.setPrice(item.getPrice());
        sysHotelOrder.setUserId(TokenUtils.getUserIdByToken());
        boolean save = sysHotelOrderService.save(sysHotelOrder);
        if (save) {
            return Result.success();
        } else {
            return Result.fail(ResultCode.COMMON_DATA_OPTION_ERROR.getMessage());
        }
    }

    /** 编辑酒店预约 */
    @PostMapping("editSysHotelOrder")
    public Result editSysHotelOrder(@RequestBody SysHotelOrder sysHotelOrder) {
        boolean save = sysHotelOrderService.updateById(sysHotelOrder);
        if (save) {
            return Result.success();
        } else {
            return Result.fail(ResultCode.COMMON_DATA_OPTION_ERROR.getMessage());
        }
    }

    /** 删除酒店预约 */
    @GetMapping("removeSysHotelOrder")
    public Result removeSysHotelOrder(@RequestParam("ids")String ids) {
        if (StringUtils.isNotBlank(ids)) {
            String[] asList = ids.split(",");
            for (String id : asList) {
                sysHotelOrderService.removeById(id);
            }
            return Result.success();
        } else {
            return Result.fail("酒店预约id不能为空！");
        }
    }

}
