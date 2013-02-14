
public privileged aspect BankAspect {
	
	private boolean BankAccount.priv;
	
	public String BankAccount.deposit(int amount){
		System.out.println("Now in ASPECT SUCCESS");
		return "";
	}
	
	public boolean BankAccount.isPriv() {
		return priv;
	}
	

	//Setter method to set the priv attribute of an account
	public void BankAccount.setPriv(boolean priv) {
		this.priv = priv;
	}

		
	//Pointcuts
	pointcut depositMethod(BankAccount ba) : this(ba) && execution(public int deposit(int)); 
	pointcut withDrawMethod(BankAccount ba) : this(ba) && execution(public void withDraw(int));
	pointcut calculateInterestMethod(BankAccount ba) : this(ba) && execution(public void calculateInterest());
	
	//After Advice use to add some constant after returning result
	after(BankAccount ba) returning (int result) : depositMethod(ba) {
		System.out.println("The privilege of the account: " +ba.getAccountNum() +" is set to: "+ba.isPriv());
		if(ba.isPriv()){

			ba.setBalance(result + 50);
			
		}
		System.out.println("The amount deposited is: "+result);
	}
	
	//Before Advice to set privilege depending based on state before executing method
	before(BankAccount ba): depositMethod(ba){
		if((!ba.isPriv()) && ba.getBalance() > 500){
			ba.setPriv(true);
		}
	}
	
//	before(BankAccount ba): depositMethod(ba){
//		if(ba.getBalance() < 10){
//			throw new IllegalArgumentException("Testing Exception");
//		}
//	}

	
	
	//Before Advice to allow withdrawing of more amount 
//	before(BankAccount ba) : withDrawMethod(ba) {
//			if(!(ba.isPriv())){
//			ba.setPriv(true);
//			System.out.println("The priv of account no: "+ba.getAccountNum()+"is now set to: "+ba.isPriv());
//		}
//	}
	
	//After Advice to update the privilege variable depending on state after return from method
	after(BankAccount ba) returning () : withDrawMethod(ba) {
		System.out.println("The privilege of the account: " +ba.getAccountNum() +" is set to: "+ba.isPriv());
//		if(ba.getBalance() < 100){
//			throw new IllegalArgumentException("Testing Exception");
//		}
		if(ba.isPriv() && ba.getBalance() < 500){

			ba.setPriv(false);
			
			System.out.println("The priv of account no: "+ba.getAccountNum()+"is now set to: "+ba.isPriv());
		}
		else if(!(ba.isPriv()) && ba.getBalance() > 500){
			ba.setPriv(true);
		}
	}
	
	//Around Advice to either proceed with execution of withDrawMethod or not 
		void around(BankAccount ba, int amount) : withDrawMethod(ba) && args(amount) {
			if((amount > 200) && ba.isPriv()){
				proceed(ba, amount);
				System.out.println("In amount > 200 & Priv set");
			}
			else if((amount > 200) && (!ba.isPriv())){
				System.out.println("In amount > 200 & Priv not set");
				System.out.println("Cannot withdraw that amount");
			}
			else{
				System.out.println("In amount < 200 & Priv set/not set");
				proceed(ba, amount);
			}
		}

	//Around Advice to calculate different interest rate based on privilege of the account
	void around(BankAccount ba) : calculateInterestMethod(ba){
		int currBal = ba.getBalance();
		int rate = 10;
		int interest = 0;
		if(ba.isPriv()){
			rate = 15;
		}
		interest = (currBal * rate)/100;
		int total = currBal + interest;
		ba.setBalance(total);
		if(ba.getBalance() > 500){
			ba.setPriv(true);
		}
		System.out.println("The interest rate is: "+rate);
		System.out.println("The interest is calculated based on aspect method is: "+interest);
		System.out.println("The new balance from aspect is is: "+ba.getBalance());
	}

}
