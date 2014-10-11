package twitter

import grails.transaction.Transactional
import grails.util.Holders
import twitter4j.Status
import twitter4j.Twitter
import twitter4j.TwitterFactory
import twitter4j.conf.ConfigurationBuilder

@Transactional
class TweetService {

    def ga = Holders.applicationContext.getBean("grailsApplication")

    def tweet(latestStatus) {
        ConfigurationBuilder cb = new ConfigurationBuilder();
        cb.setDebugEnabled(true)
                .setOAuthConsumerKey(ga.config.oauth.consumerKey)
                .setOAuthConsumerSecret(ga.config.oauth.consumerSecret)
                .setOAuthAccessToken(ga.config.oauth.accessToken)
                .setOAuthAccessTokenSecret(ga.config.oauth.accessTokenSecret);
        TwitterFactory tf = new TwitterFactory(cb.build());
        Twitter twitter = tf.getInstance();
        // Status status = twitter.updateStatus("$latestStatus #zombieInvasion #zombie #WalkingDead #zombies #ZombieWalk");
        Status status = twitter.updateStatus("$latestStatus");
        System.out.println("Successfully updated the status to [" + status.getText() + "].");
    }
}
