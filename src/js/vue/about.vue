<style lang="less" scoped>
    @black: #222;
    @white: #ddd;

    #about {
        height: 100vh;
        background: @black;
        color: @white;
    }

    .section {
        text-align: center;
        height: 50vh;
    }

    .container {
        padding-top: 3rem;
    }

    @diameter: 3em;
    .ring {
        border: 2px solid @white;
        border-radius: 50%;
        font-size: 5em;
        height: @diameter;
        width: @diameter;
        margin: 0 auto;
        line-height: @diameter;
        vertical-align: middle;
    }

    @media (max-width: 768px) {
        .ring {
            @query-diameter: @diameter * 0.8;
            font-size: 3.75em;
            height: @query-diameter;
            width: @query-diameter;
            line-height: @query-diameter;
        }
    }

</style>

<template>
    <section id="about">
        <div class="container">
            <div class="row section">
                <div class="five columns">
                    <div class="resume ring">CV</div>
                </div>
                <div class="five columns u-pull-right">
                    <div class="ring"></div>
                </div>
            </div>
            <div class="row section">
                <div class="twelve columns">
                    Lorem ipsum dolor sit amet, sit vidisse accusamus in, te vix purto dicunt. Id option virtute reprehendunt usu, ut pro habemus alienum. Te nec munere soleat, ei quis indoctum reprimique pri. Ne sed percipit petentium delicatissimi, no mel sumo perpetua, ex mundi noster scaevola per.
                </div>
            </div>
        </div>
    </section>
</template>

<script>
    module.exports = {
        name: 'about',
        data: function () {
            return {
                scrolledToAbout: false,
                arrowTimerStarted: false,
                arrowDisplayed: false,
                arrowTimeout: undefined
            };
        },
        methods: { // TODO add Lodash debounce function
            handleScroll: function () {
                this.scrolledToAbout = window.scrollY > this.$el.offsetHeight / 2;

                if (this.scrolledToAbout &&  !this.arrowTimerStarted && !this.arrowDisplayed) {
                    this.arrowTimerStarted = true;
                    this.arrowTimeout = setTimeout(this.displayArrow, 3000);
                }
                if (!this.scrolledToAbout) {
                    this.arrowDisplayed = false;
                    if (this.arrowTimerStarted) {
                        clearTimeout(this.arrowTimeout);
                        this.arrowTimerStarted = false;
                        console.log("arrow display prevented");
                    }
                }
            },
            displayArrow: function () {
                console.log("Arrow Displayed");
                this.arrowDisplayed = true;
                this.arrowTimerStarted = false;
            }
        },
        created: function () {
            window.addEventListener('scroll', this.handleScroll);
        },
        destroyed: function () {
            window.removeEventListener('scroll', this.handleScroll);
        }
    };
</script>