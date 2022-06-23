public class StringArrayTes_2 {
    public  String[] GenerateStringArray_2(integer LengthArray)
    {
        String[] StArray=new String[LengthArray];
       	for (integer n=0; n<LengthArray;n++ )
        {
           StArray[n]= ('Test:'+n);
            System.debug('Array: ' +StArray );
        }
        	System.debug('Array: ' +StArray );
            return StArray;
    }      
}