package com.shanzhu.tourism.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shanzhu.tourism.domain.SysComments;
import com.shanzhu.tourism.mapper.SysCommentsMapper;
import com.shanzhu.tourism.service.SysCommentsService;
import org.springframework.stereotype.Service;

@Service
public class SysCommentsServiceImpl extends ServiceImpl<SysCommentsMapper, SysComments> implements SysCommentsService {
}
