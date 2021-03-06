//Generated by wsdl2apex

public class AsyncWsCdyneCom {
    public class AdvancedVerifyEmailResponse_elementFuture extends System.WebServiceCalloutFuture {
        public wsCdyneCom.ReturnIndicator getValue() {
            wsCdyneCom.AdvancedVerifyEmailResponse_element response = (wsCdyneCom.AdvancedVerifyEmailResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.AdvancedVerifyEmailResult;
        }
    }
    public class ReturnCodesResponse_elementFuture extends System.WebServiceCalloutFuture {
        public wsCdyneCom.ArrayOfAnyType getValue() {
            wsCdyneCom.ReturnCodesResponse_element response = (wsCdyneCom.ReturnCodesResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.ReturnCodesResult;
        }
    }
    public class VerifyMXRecordResponse_elementFuture extends System.WebServiceCalloutFuture {
        public Integer getValue() {
            wsCdyneCom.VerifyMXRecordResponse_element response = (wsCdyneCom.VerifyMXRecordResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.VerifyMXRecordResult;
        }
    }
    public class VerifyEmailResponse_elementFuture extends System.WebServiceCalloutFuture {
        public wsCdyneCom.ReturnIndicator getValue() {
            wsCdyneCom.VerifyEmailResponse_element response = (wsCdyneCom.VerifyEmailResponse_element)System.WebServiceCallout.endInvoke(this);
            return response.VerifyEmailResult;
        }
    }
    public class AsyncEmailVerNoTestEmailSoap {
        public String endpoint_x = 'http://ws.cdyne.com/emailverify/Emailvernotestemail.asmx';
        public Map<String,String> inputHttpHeaders_x;
        public String clientCertName_x;
        public Integer timeout_x;
        private String[] ns_map_type_info = new String[]{'http://ws.cdyne.com/', 'wsCdyneCom'};
        public AsyncWsCdyneCom.AdvancedVerifyEmailResponse_elementFuture beginAdvancedVerifyEmail(System.Continuation continuation,String email,Integer timeout,String LicenseKey) {
            wsCdyneCom.AdvancedVerifyEmail_element request_x = new wsCdyneCom.AdvancedVerifyEmail_element();
            request_x.email = email;
            request_x.timeout = timeout;
            request_x.LicenseKey = LicenseKey;
            return (AsyncWsCdyneCom.AdvancedVerifyEmailResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncWsCdyneCom.AdvancedVerifyEmailResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://ws.cdyne.com/AdvancedVerifyEmail',
              'http://ws.cdyne.com/',
              'AdvancedVerifyEmail',
              'http://ws.cdyne.com/',
              'AdvancedVerifyEmailResponse',
              'wsCdyneCom.AdvancedVerifyEmailResponse_element'}
            );
        }
        public AsyncWsCdyneCom.ReturnCodesResponse_elementFuture beginReturnCodes(System.Continuation continuation) {
            wsCdyneCom.ReturnCodes_element request_x = new wsCdyneCom.ReturnCodes_element();
            return (AsyncWsCdyneCom.ReturnCodesResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncWsCdyneCom.ReturnCodesResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://ws.cdyne.com/ReturnCodes',
              'http://ws.cdyne.com/',
              'ReturnCodes',
              'http://ws.cdyne.com/',
              'ReturnCodesResponse',
              'wsCdyneCom.ReturnCodesResponse_element'}
            );
        }
        public AsyncWsCdyneCom.VerifyMXRecordResponse_elementFuture beginVerifyMXRecord(System.Continuation continuation,String email,String LicenseKey) {
            wsCdyneCom.VerifyMXRecord_element request_x = new wsCdyneCom.VerifyMXRecord_element();
            request_x.email = email;
            request_x.LicenseKey = LicenseKey;
            return (AsyncWsCdyneCom.VerifyMXRecordResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncWsCdyneCom.VerifyMXRecordResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://ws.cdyne.com/VerifyMXRecord',
              'http://ws.cdyne.com/',
              'VerifyMXRecord',
              'http://ws.cdyne.com/',
              'VerifyMXRecordResponse',
              'wsCdyneCom.VerifyMXRecordResponse_element'}
            );
        }
        public AsyncWsCdyneCom.VerifyEmailResponse_elementFuture beginVerifyEmail(System.Continuation continuation,String email,String LicenseKey) {
            wsCdyneCom.VerifyEmail_element request_x = new wsCdyneCom.VerifyEmail_element();
            request_x.email = email;
            request_x.LicenseKey = LicenseKey;
            return (AsyncWsCdyneCom.VerifyEmailResponse_elementFuture) System.WebServiceCallout.beginInvoke(
              this,
              request_x,
              AsyncWsCdyneCom.VerifyEmailResponse_elementFuture.class,
              continuation,
              new String[]{endpoint_x,
              'http://ws.cdyne.com/VerifyEmail',
              'http://ws.cdyne.com/',
              'VerifyEmail',
              'http://ws.cdyne.com/',
              'VerifyEmailResponse',
              'wsCdyneCom.VerifyEmailResponse_element'}
            );
        }
    }
}