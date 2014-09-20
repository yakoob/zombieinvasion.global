package ip

import grails.validation.Validateable
import groovy.transform.TupleConstructor

@Validateable
@TupleConstructor
class MinFraudInfo {
    Boolean freeMail
    Boolean anonymousProxy = false
    Double proxyScore
    Boolean transProxy = false
    Boolean ipCorporateProxy = false
    Double score
    Double riskScore
    String explanation

    static constraints = {
        freeMail nullable: true
        anonymousProxy nullable: true
        proxyScore nullable: true
        transProxy nullable: true
        ipCorporateProxy nullable: true
        score nullable: true
        riskScore nullable: true
        explanation nullable: true
    }

    void setScore(String score) {
        this.score = toDouble(score)
    }

    void setRiskScore(String riskScore) {
        this.riskScore = toDouble(riskScore)
    }

    void setProxyScore(String proxyScore) {
        this.proxyScore = toDouble(proxyScore)
    }

    void setFreeMail(String freeMail) {
        this.freeMail = (freeMail == "Yes")
    }

    //TODO: test this type of proxy
    void setAnonymousProxy(String anonymousProxy) {
        this.anonymousProxy = (anonymousProxy == "Yes")
    }

    //TODO: test this type of proxy
    void setIsTransProxy(String isTransProxy) {
        this.transProxy = (isTransProxy == "Yes")
    }

    //TODO: test this type of proxy
    void setIp_corporateProxy(String ip_corporateProxy) {
        this.ipCorporateProxy = (ip_corporateProxy == "Yes")
    }

    private Double toDouble(String s) {
        if(s != null) {
            try {
                return new Double(s.trim())
            } catch (NumberFormatException e) {}
        }
        return null
    }
}
