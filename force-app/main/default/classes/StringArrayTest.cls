public class StringArrayTest
{
	public  List<String> GenerateStringArray(integer LengthArray)
    {
		List<String> StArray = new List<String>();
       	for (integer n=0; n<=LengthArray;n++ )
        {
            StArray.add('Test:'+n);
        }
        	System.debug('Array: ' +StArray );
            return StArray;
         
     }          
}