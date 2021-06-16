package dto;

import java.io.Serializable;

public class abandonedDogDto implements Serializable{
	
	private int seq;			//글번호
	private String myid;		//작성자id
	private int phonenum;		//작성자 연락처
	private String address; 	//유기견의 발견 장소
	private String mycontent;		//내용
	private String filename;	//유기견 사진 
	private String newfilename; //이미지
	private int danger;			//위험등급(유기견의 상태)
	private String wdate;		//제보일자
	
	public abandonedDogDto() {}

	public abandonedDogDto(int seq, String myid, int phonenum, String address, String mycontent, String filename,
			String newfilename, int danger, String wdate) {
		super();
		this.seq = seq;
		this.myid = myid;
		this.phonenum = phonenum;
		this.address = address;
		this.mycontent = mycontent;
		this.filename = filename;
		this.newfilename = newfilename;
		this.danger = danger;
		this.wdate = wdate;
	}

	public abandonedDogDto(String myid, int phonenum, String address, String mycontent, String filename,
			String newfilename, int danger) {
		super();
		this.myid = myid;
		this.phonenum = phonenum;
		this.address = address;
		this.mycontent = mycontent;
		this.filename = filename;
		this.newfilename = newfilename;
		this.danger = danger;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getMyid() {
		return myid;
	}

	public void setMyid(String myid) {
		this.myid = myid;
	}

	public int getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(int phonenum) {
		this.phonenum = phonenum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMycontent() {
		return mycontent;
	}

	public void setMycontent(String mycontent) {
		this.mycontent = mycontent;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getNewfilename() {
		return newfilename;
	}

	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}

	public int getdanger() {
		return danger;
	}

	public void setdanger(int danger) {
		this.danger = danger;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	
	
	
	
}
