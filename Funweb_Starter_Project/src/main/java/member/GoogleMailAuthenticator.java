package member;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleMailAuthenticator extends Authenticator{

	private PasswordAuthentication passwordAuthentication;

	public GoogleMailAuthenticator() {
		 passwordAuthentication = new PasswordAuthentication("tgim1456","lszxokgtfvfgqgcz");
	
	}

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return passwordAuthentication;
	}
	
	
}
