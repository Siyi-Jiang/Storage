/* Simulates a physical device that performs (signed) addition on a 32-bit input.
 *
 * Author: Siyi Jiang
 */

public class Proj01_ADD
{
	public void execute()
	{
		carryOut = false;
		
		for(int i = 0; i < 32; i++)
		{
			if(carryOut)
			{
				if(a[i] == false && b[i] == false)
					carryOut = false;
				
				if((a[i] == true && b[i] == false) || (a[i] == false && b[i] == true))
				{
					sum[i] = false;
					continue;
				}
				
				sum[i] = true;
			}
			else
			{
				if(a[i] && b[i])
				{
					sum[i] = false;
					carryOut = true;
					continue;
				}
				
				if(!a[i] && !b[i])
				{
					sum[i] = false;
					continue;
				}
				
				sum[i] = true;
			}
		}
		
		if(a[31] == b[31] && a[31] != sum[31])
			overflow = true;
	}



	// ------ DON'T CHANGE ANYTHING BELOW THIS LINE ------

	// inputs
	public boolean[] a,b;

	// outputs
	public boolean[] sum;
	public boolean   carryOut, overflow;

	public Proj01_ADD()
	{
		a   = new boolean[32];
		b   = new boolean[32];
		sum = new boolean[32];
	}
}

