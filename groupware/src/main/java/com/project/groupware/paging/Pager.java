package com.project.groupware.paging;

public class Pager {
	private int PAGE_SCALE =10; //한페이지에 보여지는 게시물 개수
	private int BLOCK_SCALE=10; // 한페이지에 보여지는 페이지번호 개수
	
	private int curPage; //현재페이지
	private int prevPage;
	private int nextPage;
	private int totalPage;
	
	private int curBlock;
	private int prevBlock;
	private int nextBlock;
	private int totalBlock;
	
	private int pageBegin;
	private int pageEnd;
	
	private int blockBegin;
	private int blockEnd;
	
	

	//페이지생성자
	public Pager(int count, int curPage) {
		this.curPage = curPage;
		curBlock=1;
		
		setTotalPage(count);
		setTotalBlock();
		
		setPageRange(curPage);
		setBlockRange();
	}
	
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int count) {
		totalPage = (int) Math.ceil(count * 1.0 / PAGE_SCALE);
	}
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	public int getPrevBlock() {
		return prevBlock;
	}
	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}
	public int getNextBlock() {
		return nextBlock;
	}
	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getPageBegin() {
		return pageBegin;
	}
	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}
	public int getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}
	public int getBlockBegin() {
		return blockBegin;
	}
	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}
	public int getBlockEnd() {
		return blockEnd;
	}
	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}
	
	public void setTotalBlock() {
		totalBlock = (int)Math.ceil(totalPage / BLOCK_SCALE);
	}
	
	public void setPageRange(int curPage) {
		pageBegin = (curPage -1 ) * PAGE_SCALE;
		pageEnd = (int) (Math.ceil(curPage / (double)PAGE_SCALE )* PAGE_SCALE);
	}
	
	public void setBlockRange() {
		curBlock   = (int) Math.ceil( (curBlock -1) / BLOCK_SCALE ) +1;
		blockBegin = (curBlock -1) * BLOCK_SCALE  +1;
		blockEnd = blockBegin + BLOCK_SCALE -1;
		
		if( blockEnd > totalPage ) blockEnd = totalPage;
		
		prevPage = (curPage == 1 ) ? 1 : (curPage -1) * BLOCK_SCALE; 
		nextPage = curBlock > totalBlock ? (curBlock * BLOCK_SCALE) : (curBlock * BLOCK_SCALE) +1;
		
		if( nextPage >= totalPage ) nextPage = totalPage;
	}
}
