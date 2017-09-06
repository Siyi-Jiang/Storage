/* Implementation of a 32-bit adder in C.
 *
 * Author: Siyi Jiang
 */


#include "proj01.h"



void execute_add(Proj01Data *obj)
{
	int i;
	obj->carryOut = 0;
	obj->overflow = 0;

	for(i = 0; i < 32; i++)
	{
		int abit, bbit,sumbit;
		abit = (obj->a >> i) & 0x1;
		bbit = (obj->b >> i) & 0x1;

		if(abit && bbit)
		{
			if(obj->carryOut)
				sumbit = 1;
			else
			{
				sumbit = 0;
				obj->carryOut = 1;
			}
		}
		else if(!abit && !bbit)
		{
			if(obj->carryOut)
			{
				sumbit = 1;
				obj->carryOut = 0;
			}
			else
				sumbit = 0;
		}
		else
		{
			if(obj->carryOut)
				sumbit = 0;
			else
				sumbit = 1;
		}

		obj->sum = obj->sum | (sumbit << i);

		if(i == 31)
		{
			if(abit == bbit && abit != sumbit)
				obj->overflow = 1;
		}
	}
}

