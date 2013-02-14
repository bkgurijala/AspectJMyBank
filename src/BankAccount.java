
public class BankAccount {
	
	private int accountNum;
	private int balance;
	
	
	//Setter method to set the balance attribute of an account
	public void setBalance(int balance) {
		this.balance = balance;
	}

	//Getter method to get the current value of priv attribute of an account	
	
	//Constructor to initialize
	BankAccount(){
		this(0, 0);
	}
	
	//Constructor to initialize by passing account number and balance deposited
	BankAccount(int accountNo, int bal){
		this.accountNum = accountNo;
		this.balance = bal;
	}
	
	//method to handle deposits into the account
	public int deposit(int amount){
		if(amount > 10){
		balance += amount;
		}
		else{
			System.out.println("The amount is too low to be deposited");
		}
		return balance;
	}
	
	//method to handle withdrawals from the account
	public void withDraw(int amount){
		if(this.balance > amount && amount > 5){
	//	if(amount > 200 && this.priv){
				balance -= amount;
		}
		else if (this.balance > amount && amount < 5){
				System.out.println("You can withdraw amounts higher than $5");
			}
		//}
		//else if(amount > 200 && !this.priv)
		//{
			//System.out.println("Cannot withdraw huge amounts");
		//}
		//else{
			//balance -= amount;
		//}
		
		else{
			System.out.println("The account does not have enough balance. Try another amount");
		}
	}
	
	//Method to calculate interest on the balance amount in the account
	public void calculateInterest(){
		System.out.println("The interest rate used is: 5");
		this.balance = this.balance + this.balance * (5/100);
	}
	
	//getter method to get the current balance of the account
	public int getBalance(){
		return balance;
	}
	
	//getter method to get the accountNum
	public int getAccountNum(){
		return accountNum;
	}

}
