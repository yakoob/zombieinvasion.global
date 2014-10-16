
<sec:ifNotLoggedIn>
    <div class="alert alert-danger" role="alert">
        <b>You are not authenticated... Your donation will not award points to your Zombie.  If you wish to receive points please</b> <g:render template="/login/alertLogin"></g:render>
    </div>
</sec:ifNotLoggedIn>

<div class="jumbotron2">
    <h3 style="color: #A94442">MMmmmmm.... braaaiiiinssss... Well, even zombies have bills to pay.  Please help us keep our servers running by making a donation, while quickly earning points towards your zombie rank.</h3>
</div>

<div class="bs-example">
    <div class="row">
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <img src="${assetPath(src: 'zi_icon_viral_zombie.png')}" style="height: 100px; display: block;">
                <div class="caption">
                    <h3>Viral Zombie <span class="badge">50 Points</span></h3>
                    <p>Even $2 bucks will help us maintain our zombie realm.</p>
                    <script async="async" src="${assetPath(src: 'paypal-button.min.js')}?merchant=info@zombieinvasion.global"
                            data-button="donate"
                            data-name="Donation"
                            data-amount="2"
                            data-custom="${sec.username()}"
                            data-text="$2 Donation"
                            data-callback="https://zombieinvasion.global/payment/paypal/ipn"
                            data-return="https://zombieinvasion.global"
                    ></script>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <img src="${assetPath(src: 'zi_icon_zombie_king.png')}" style="height: 100px; display: block;">
                <div class="caption">
                    <h3>Zombie King <span class="badge">100 Points</span></h3>

                    <p>Your $10 donation will help us maintain our zombie realm.</p>

                    <script async="async" src="${assetPath(src: 'paypal-button.min.js')}?merchant=info@zombieinvasion.global"
                            data-button="donate"
                            data-name="Donation"
                            data-amount="10"
                            data-text="$10 Donation"
                            data-custom="${sec.username()}"
                            data-callback="https://zombieinvasion.global/payment/paypal/ipn"
                            data-return="https://zombieinvasion.global"
                    ></script>

                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <img src="${assetPath(src: 'zi_icon_iscream_zombie.png')}" style="height: 100px; display: block;">
                <div class="caption">
                    <h3>IScream Zombie <span class="badge">300 Points</span></h3>
                    <p>Your $25 donation goes a long way in maintaining our zombie realm.</p>
                    <script async="async" src="${assetPath(src: 'paypal-button.min.js')}?merchant=info@zombieinvasion.global"
                            data-button="donate"
                            data-name="Donation"
                            data-amount="25"
                            data-text="$25 Donation"
                            data-custom="${sec.username()}"
                            data-callback="https://zombieinvasion.global/payment/paypal/ipn"
                            data-return="https://zombieinvasion.global"
                    ></script>

                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <img src="${assetPath(src: 'zi_icon_blood_zombie.png')}" style="height: 100px; display: block;">
                <div class="caption">
                    <h3>Blood Zombie <span class="badge">500 Points</span></h3>
                    <p>Your generous $50 donation goes a long way in maintaining our zombie realm.</p>
                    <script async="async" src="${assetPath(src: 'paypal-button.min.js')}?merchant=info@zombieinvasion.global"
                            data-button="donate"
                            data-name="Donation"
                            data-amount="50"
                            data-text="$50 Donation"
                            data-custom="${sec.username()}"
                            data-callback="https://zombieinvasion.global/payment/paypal/ipn"
                            data-return="https://zombieinvasion.global"
                    ></script>
                </div>
            </div>
        </div>


        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <img src="${assetPath(src: 'zi_icon_zombie_overlord.png')}" style="height: 100px; display: block;">
                <div class="caption">
                    <h3>Zombie Overlord <span class="badge">1000 Points</span></h3>
                    <p>You awesome brain eater!!!</p>
                    <script async="async" src="${assetPath(src: 'paypal-button.min.js')}?merchant=info@zombieinvasion.global"
                            data-button="donate"
                            data-name="Donation"
                            data-amount="100"
                            data-text="$100 Donation"
                            data-custom="${sec.username()}"
                            data-callback="https://zombieinvasion.global/payment/paypal/ipn"
                            data-return="https://zombieinvasion.global"
                    ></script>

                </div>
            </div>
        </div>

        <div class="col-sm-6 col-md-4">
            <div class="thumbnail">
                <img src="${assetPath(src: 'icon_nuclear_vs.png')}" style="height: 100px;">
                <div class="caption">
                    <h3>Nuclear Zombie <span class="badge">2000 Points</span></h3>
                    <p>Do you have so much money you have no idea what to do with it???  Well we do...  You'll be awarded with the V.I.Z Five Star Nuclear Zombie!</p>
                    <script async="async" src="${assetPath(src: 'paypal-button.min.js')}?merchant=info@zombieinvasion.global"
                            data-button="donate"
                            data-name="Donation"
                            data-amount="500"
                            data-text="$500 Donation"
                            data-custom="${sec.username()}"
                            data-callback="https://zombieinvasion.global/payment/paypal/ipn"
                            data-return="https://zombieinvasion.global"
                    ></script>

                </div>
            </div>
        </div>

        <%--- https://www.kickstarter.com/projects/22092473/the-map-of-zombies ---%>

    </div>
</div>

