public class ClassTest3 {
    Public static void generateOppPDF (Opportunity Opp){
        String Titulo =   '<H1>'+'PDF For Opportunity'+'<H1/>'+'<Br/>';
            String Cuerpo= '<Body>'+'<p style="font-size:10%;">'+'Nombre:'+Opp.Name+'<Br/>'+'Estado:'+Opp.StageName+'<Br/>'+
            'Close Date:'+Opp.CloseDate+'<Br/>'+'Account Id:'+Opp.AccountId+'<Br/>'+
            'Amount:'+Opp.Amount+'<p/>'+'<Body>';
        Blob body;
        body = blob.toPdf(Titulo+Cuerpo);
        /* se crea el pdf al content version*/
        ContentVersion CV = new ContentVersion();
        /* se crea la unión del pdf a la oportunidad*/
        ContentDocumentLink CDL= new ContentDocumentLink();
        
        CV.Versiondata =  body;            
        CV.PathOnClient = 'path';
        CV.Title = Opp.Name+'PDF_file.pdf';
        insert CV;
        // en este caso se busca la version para unirse con la el contenido del documento pdf 
        ContentVersion idcontentdocumentid = [SELECT ContentDocumentId FROM ContentVersion WHERE ID=:CV.Id];
        CDL.ContentDocumentId = idcontentdocumentid.ContentDocumentId;
        CDL.LinkedEntityId = Opp.Id;
        CDL.ShareType = 'V';
        insert CDL; 
    }
}