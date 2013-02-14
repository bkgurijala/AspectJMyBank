
public class TestMyBank {
	
	public static void main(String[] args){
		BankAccount ba = new BankAccount(1, 300);
		BankAccount ba1 = new BankAccount(2,550);
		//ba1.setPriv(true);
		ba.deposit(25);
		ba.withDraw(20);
		ba.withDraw(225);
		//System.out.println("The priv of ba account is: "+ba.isPriv());
		ba.withDraw(10);
		ba.deposit(220);
		ba1.deposit(200);
		ba1.withDraw(250);
		ba1.withDraw(541);
		ba1.deposit(10);
		System.out.println("The current balance in the ba account is: "+ba.getBalance());
		System.out.println("The current balance in the ba1 account is: "+ba1.getBalance());
		ba.calculateInterest();
		ba1.calculateInterest();
	}

}
