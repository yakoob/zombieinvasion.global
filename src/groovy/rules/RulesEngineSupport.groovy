package rules

import account.Account
import user.User

class RulesEngineSupport implements RulesEngine {

    // Deduce the class-level closure list for a given class
    public List<String> getRules() {
        List<String> rules = []
        this.class.declaredFields.each {
            def field = this."${it.name}"
            if (!it.isSynthetic() && field instanceof Closure && it.name.endsWith("Rule")) {
                rules << it.name
            }
        }
        return rules;
    }

    public Set apply(Account obj) {
        Set responseSet = [] as Set
        rules.each { String rule ->
            responseSet << this."$rule"(obj)
        }
        return responseSet;
    }

    public void apply(User user) {

        rules.each { String rule ->
            this."$rule"(user)
        }

    }

}