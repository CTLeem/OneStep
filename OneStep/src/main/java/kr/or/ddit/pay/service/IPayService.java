package kr.or.ddit.pay.service;

import javax.servlet.http.HttpServletRequest;

import kr.or.ddit.prod.vo.ProdVO;

public interface IPayService {

	void insertMem(ProdVO pay);
	
//	void insertCom( ProdVO pay);

	void insertCom(HttpServletRequest req,ProdVO pay)  throws Exception;

	void insertComp(ProdVO pay);

	

}
