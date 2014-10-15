package user

import grails.util.Holders
import groovy.util.logging.Log4j
import ip.IpAddress
import message.IncreaseScore
import message.SpawnZombie
import payment.PaymentLog
import region.City

@Log4j
class TwitterUser  {

    /**
     * Twitter Username (notice that it could be modified by user, Twitter allows that)
     */
    String username

    /**
     * Twitter User Id
     */
    Long twitterId

    /**
     * Twitter API token
     */
    String token

    /**
     * Twitter API secret
     */
    String tokenSecret

    enum Rank {
        Noob,
        Viral_Zombie,
        Zombie_King,
        IScream_Zombie,
        Blood_Zombie,
        Zombie_Overlord,
        Nuclear_Zombie,
        VIZ_Nuclear_Zombie
    }
    Rank rank = Rank.Noob

    Long score = 0L

    static belongsTo = [user: user.User]

    static hasMany = [ips: IpAddress, cities: City, payments: PaymentLog]

    static mapping = {
        rank enumType: "String"
    }

    def getDisplayRank(){
        rank.name().replace("_", " ")
    }

    def afterInsert(){
        def tweetService = Holders.applicationContext.getBean("tweetService")
        def akkaService = Holders.applicationContext.getBean("akkaService")
        def zombieManagerService = Holders.applicationContext.getBean("zombieManagerService")

        zombieManagerService.actorRef.tell(new SpawnZombie(name: this.username), akkaService.actorNoSender())
        zombieManagerService.actorRef.tell(new IncreaseScore(points: 5, name: this.username), akkaService.actorNoSender())

        try {
            tweetService.tweet("@${this.username} is now UnDead https://zombieinvasion.global/z/${this.user.id} " )
        } catch (e){
            log.error(e)
        }

    }

    static constraints = {
        twitterId(unique: true, nullable: false)
        username(nullable: false, blank: false)
        ips nullable: true
        cities nullable: true
    }

    def getIcon(){
        def res = new ZombieIcon()
        switch(this.rank) {
            case Rank.Noob:
                res.path = "zi_icon.png"
                res.markerPath = "zi_icon_zombie_marker.png"
                break
            case Rank.Viral_Zombie:
                res.path = "zi_icon_viral_zombie.png"
                res.markerPath = "zi_icon_viral_zombie_marker.png"
                break
            case Rank.Zombie_King:
                res.path = "zi_icon_zombie_king.png"
                res.markerPath = "zi_icon_zombie_king_marker.png"
                break
            case Rank.IScream_Zombie:
                res.path = "zi_icon_iscream_zombie.png"
                res.markerPath = "zi_icon_iscream_zombie_marker.png"
                break
            case Rank.Blood_Zombie:
                res.path = "zi_icon_blood_zombie.png"
                res.markerPath = "zi_icon_blood_zombie_marker.png"
                break
            case Rank.Zombie_Overlord:
                res.path = "zi_icon_zombie_overlord.png"
                res.markerPath = "zi_icon_zombie_overlord_marker.png"
                break
            case Rank.Nuclear_Zombie:
                res.path = "zi_icon_nuclear_zombie.png"
                res.markerPath = "zi_icon_nuclear_zombie_marker.png"
                break
            case Rank.VIZ_Nuclear_Zombie:
                res.path = "zi_icon_nuclear_zombie_5star.png"
                res.markerPath = "zi_icon_nuclear_zombie_5star_marker.png"
                break
        }
        return res
    }
}