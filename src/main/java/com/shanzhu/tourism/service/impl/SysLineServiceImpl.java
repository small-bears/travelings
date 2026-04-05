package com.shanzhu.tourism.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shanzhu.tourism.domain.SysLine;
import com.shanzhu.tourism.mapper.SysLineMapper;
import com.shanzhu.tourism.service.SysLineService;
import org.springframework.stereotype.Service;

@Service
public class SysLineServiceImpl extends ServiceImpl<SysLineMapper, SysLine> implements SysLineService {
}
