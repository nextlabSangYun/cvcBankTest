package kr.co.nextlab.test.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nextlab.comm.model.PageList;
import kr.co.nextlab.comm.model.PagingVo;
import kr.co.nextlab.test.mapper.TestMapper;
import kr.co.nextlab.test.model.TestCriteria;
import kr.co.nextlab.test.model.TestVo;
import kr.co.nextlab.test.service.TestService;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestMapper testMapper;
	
	public TestVo selectTestTran() {
		return testMapper.selectTestTran();
	}
	
	public int intertTestTran(TestVo testVo) {
		return testMapper.intertTestTran(testVo);
	}
	
	public int updateTestTran(TestVo testVo) {
		testMapper.updateTestTran(testVo);
		return 1;
	}
	
	public PageList<TestVo> selectPageList(TestCriteria criteria) {
		long totRows = 0;
		List<TestVo> list = testMapper.selectList(criteria, new RowBounds(criteria.getFetchScale(), criteria.getRows()));
		if (list.size()>0) {
			totRows = list.get(0).getTotRows();
		}
		return new PageList<TestVo>(list, new PagingVo(totRows, criteria.getPage(), criteria.getRows()));
	}
	
	public List<TestVo> selectList(TestCriteria criteria) {
		return testMapper.selectList(criteria, new RowBounds(criteria.getFetchScale(), criteria.getRows()));
	}
	
}
