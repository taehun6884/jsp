package ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

public class MemberJSONListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward=null;
		
		List<MemberBean2> memberlist2 = new ArrayList<MemberBean2>();
		memberlist2.add(new MemberBean2("홍길동",20, new AddressBean("부산","아이티윌")));
		memberlist2.add(new MemberBean2("이순신",44,new AddressBean("서울","네이버")));
		memberlist2.add(new MemberBean2("강감찬",30,new AddressBean("제주","한라산")));
		JSONArray ja2= new JSONArray(memberlist2);
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print(ja2.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return forward;
	}

}
