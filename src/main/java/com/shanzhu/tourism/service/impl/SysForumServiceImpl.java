package com.shanzhu.tourism.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.shanzhu.tourism.domain.SysForum;
import com.shanzhu.tourism.mapper.SysForumMapper;
import com.shanzhu.tourism.service.SysForumService;
import org.springframework.stereotype.Service;

@Service
public class SysForumServiceImpl extends ServiceImpl<SysForumMapper, SysForum> implements SysForumService {
}
