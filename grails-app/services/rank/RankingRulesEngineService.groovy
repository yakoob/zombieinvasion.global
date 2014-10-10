package rank

import grails.transaction.Transactional
import groovy.util.logging.Log4j
import rules.RulesEngineSupport
import user.User

/**
 * usage:
 * rankingRulesEngineService.apply(twitterUser)
 */
@Transactional
@Log4j
class RankingRulesEngineService extends RulesEngineSupport {

    def donationRule = { User user ->

        log.info(user)

    }


    def likesRule = { User user ->

        log.info(user)

    }

    def commentsRule = { User user ->

        log.info(user)

    }

}
