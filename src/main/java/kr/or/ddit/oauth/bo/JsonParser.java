package kr.or.ddit.oauth.bo;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import kr.or.ddit.member.model.MemberVo;

public class JsonParser {
	JSONParser jsonParser = new JSONParser();

	public MemberVo changeJson(String string) throws Exception {

		HashMap<String, Object> map = new HashMap<>();
		JSONParser jsonParser = new JSONParser();
		MemberVo memberVo = new MemberVo();

		JSONObject jsonObject = (JSONObject) jsonParser.parse(string);

		jsonObject = (JSONObject) jsonObject.get("response");

		map.put("member_mail", jsonObject.get("id"));
		map.put("member_name", jsonObject.get("name"));
		map.put("member_pass", "");
		map.put("member_tel", "");

		memberVo.setMember_name(map.get("member_name").toString());
		memberVo.setMember_mail(map.get("member_mail").toString()); 
		memberVo.setMember_pass(map.get("member_pass").toString()); 
		memberVo.setMember_tel(map.get("member_tel").toString()); 
		return memberVo;
	}
}