import static org.junit.Assert.*;

import org.junit.Test;


public class BankAccountTest {

	BankAccount testBankAcct = new BankAccount(3, 200);
	@Test
	public void testDeposit() {
		testBankAcct.deposit(100);
		assertEquals("The Deposit Method Works", 300, testBankAcct.getBalance());
		testBankAcct.deposit(5);
		assertEquals("The Deposit Method Doesn't work", 305, testBankAcct.getBalance());
		
	}

	@Test
	public void testWithDraw() {
		testBankAcct.withDraw(20);
		assertEquals("The balance after withdrawing is", 180, testBankAcct.getBalance());
		testBankAcct.withDraw(220);
		assertEquals("The balance after withdrawing is", 200, testBankAcct.getBalance());
	}

	@Test
	public void testCalculateInterest() {
		//fail("Not yet implemented");
	}

}
