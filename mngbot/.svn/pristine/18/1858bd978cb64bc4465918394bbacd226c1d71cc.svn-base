package kr.co.nextlab.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.co.nextlab.test.model.TestCriteria;
import kr.co.nextlab.test.model.TestVo;

@Mapper
public interface TestMapper {
	
	public TestVo selectTestTran();
	public int intertTestTran(TestVo testVo);
	public int updateTestTran(TestVo testVo);
	
	public List<TestVo> selectList(TestCriteria criteria, RowBounds rowBounds);
	
}
