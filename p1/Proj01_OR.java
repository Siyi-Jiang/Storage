/* Simulates a physical OR gate.
 *
 * Author: Siyi Jiang
 */

public class Proj01_OR
{
	public void execute()
	{
		if(!a && !b)
			out = false;
		else
			out = true;
	}



	// ------ DON'T CHANGE ANYTHING BELOW THIS LINE ------

	public boolean a,b;   // inputs
	public boolean out;   // output

	public Proj01_OR()
	{
		/* nothing is needed here */
	}
}

