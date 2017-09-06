/* Simulates a physical device that performs 2's complement on a 32-bit input.
 *
 * Author: Siyi Jiang
 */

public class Proj01_2sComplement
{
	public void execute()
	{
		for(int i = 0; i < 32; i++)
		{
			out[i] = !in[i];
		}
		
		if(!out[0])
			out[0] = true;
		else
		{
			boolean carryOut = true;
			
			for(int i = 0; i < 32; i++)
			{
				if(out[i] == carryOut)
					out[i] = !out[i];
				else
				{
					out[i] = true;
					break;
				}
			}
		}
	}



	// you shouldn't change these standard variables...
	public boolean[] in;
	public boolean[] out;


	// TODO: add some more variables here.  You must create them
	//       during the constructor below.  REMEMBER: You're not
	//       allowed to create any object inside the execute()
	//       method above!


	public Proj01_2sComplement()
	{
		in  = new boolean[32];
		out = new boolean[32];

		// TODO: this is where you create the objects that
		//       you declared up above.
	}
}

