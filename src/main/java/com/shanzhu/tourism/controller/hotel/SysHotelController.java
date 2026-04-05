package com.shanzhu.tourism.controller.hotel;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.shanzhu.tourism.enums.ResultCode;
import com.shanzhu.tourism.service.SysAttractionsService;
import com.shanzhu.tourism.service.SysHotelItemService;
import com.shanzhu.tourism.service.SysHotelOrderService;
import com.shanzhu.tourism.service.SysHotelService;
import com.shanzhu.tourism.domain.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 酒店controller
 *
 * 
 * @date: 2024-08-10
 */
@Controller
@ResponseBody
@RequestMapping("hotel")
public class SysHotelController {

    @Resource
    private SysHotelService sysHotelService;
    @Resource
    private SysAttractionsService sysAttractionsService;
    @Resource
    private SysHotelItemService sysHotelItemService;
    @Resource
    private SysHotelOrderService sysHotelOrderService;

    /** 分页获取酒店 */
    @PostMapping("getSysHotelPage")
    public Result getSysHotelPage(@RequestBody SysHotel sysHotel) {
        Page<SysHotel> page = new Page<>(sysHotel.getPageNumber(),sysHotel.getPageSize());
        QueryWrapper<SysHotel> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda()
                .like(StringUtils.isNotBlank(sysHotel.getAttractions()),SysHotel::getAttractions,sysHotel.getAttractions())
                .eq(sysHotel.getState() != null, SysHotel::getState,sysHotel.getState())
                .like(StringUtils.isNotBlank(sysHotel.getName()),SysHotel::getName,sysHotel.getName())
                .orderByDesc(SysHotel::getCreateTime);
        Page<SysHotel> sysHotelPage = sysHotelService.page(page, queryWrapper);
        return Result.success(sysHotelPage);
    }

    /** 根据id获取酒店 */
    @GetMapping("getSysHotelById")
    public Result getSysHotelById(@RequestParam("id")String id) {
        SysHotel sysHotel = sysHotelService.getById(id);
        return Result.success(sysHotel);
    }

    /** 保存酒店 */
    @PostMapping("saveSysHotel")
    public Result saveSysHotel(@RequestBody SysHotel sysHotel) {
        SysAttractions attractions = sysAttractionsService.getById(sysHotel.getAttractionsId());
        sysHotel.setAttractions(attractions.getName());
        boolean save = sysHotelService.save(sysHotel);
        if (save) {
            return Result.success();
        } else {
            return Result.fail(ResultCode.COMMON_DATA_OPTION_ERROR.getMessage());
        }
    }

    /** 编辑酒店 */
    @PostMapping("editSysHotel")
    public Result editSysHotel(@RequestBody SysHotel sysHotel) {
        SysAttractions attractions = sysAttractionsService.getById(sysHotel.getAttractionsId());
        sysHotel.setAttractions(attractions.getName());
        boolean save = sysHotelService.updateById(sysHotel);
        if (save) {
            return Result.success();
        } else {
            return Result.fail(ResultCode.COMMON_DATA_OPTION_ERROR.getMessage());
        }
    }

    /** 删除酒店 */
    @GetMapping("removeSysHotel")
    @Transactional(rollbackFor = Exception.class)
    public Result removeSysHotel(@RequestParam("ids")String ids) {
        if (StringUtils.isNotBlank(ids)) {
            String[] asList = ids.split(",");
            for (String id : asList) {
                sysHotelService.removeById(id);
                QueryWrapper<SysHotelItem> queryWrapper = new QueryWrapper<>();
                queryWrapper.lambda().eq(SysHotelItem::getHotelId,id);
                sysHotelItemService.remove(queryWrapper);
                QueryWrapper<SysHotelOrder> wrapper = new QueryWrapper<>();
                wrapper.lambda().eq(SysHotelOrder::getHotelId,id);
                sysHotelOrderService.remove(wrapper);
            }
            return Result.success();
        } else {
            return Result.fail("酒店id不能为空！");
        }
    }

}