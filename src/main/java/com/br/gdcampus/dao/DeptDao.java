package com.br.gdcampus.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.gdcampus.dto.DeptDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class DeptDao {

    private final SqlSessionTemplate sqlSession;

    public List<DeptDto> selectDeptList() {
        return sqlSession.selectList("deptMapper.selectDeptList");
    }

    public int insertCategoryDept(DeptDto deptDto) {
        int result = sqlSession.insert("deptMapper.insertCategoryDept", deptDto);
        return result;
    }

    public int updateDept(DeptDto dept) {
        return sqlSession.update("deptMapper.updateDept", dept);
    }

    public int deleteCategoryDept(String deptNo) {
        return sqlSession.delete("deptMapper.deleteCategoryDept", deptNo);
    }

}
