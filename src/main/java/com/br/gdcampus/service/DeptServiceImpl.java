package com.br.gdcampus.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.br.gdcampus.dao.DeptDao;
import com.br.gdcampus.dto.DeptDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DeptServiceImpl implements DeptService {

    private final DeptDao deptDao;

    @Override
    public List<DeptDto> selectCategoryDeptDto() {
        return deptDao.selectDeptList();
    }

    @Override
    public int insertCategoryDept(DeptDto deptDto) {
        int result = deptDao.insertCategoryDept(deptDto);
        return result;
    }

    @Override
    public int updateCategoryDept(DeptDto dept) {
        return deptDao.updateDept(dept);
    }

    @Override
    public int deleteCategoryDept(String deptNo) {
        return deptDao.deleteCategoryDept(deptNo);
    }
}
