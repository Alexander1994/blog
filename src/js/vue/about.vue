<style lang="less" scoped>
    @import "../../less/colors";

    // arrow
    .arrow {
        @size: 3em;
        -webkit-transform: rotate(45deg);
                transform: rotate(45deg);
        border-left: 2px solid @white;
        border-top: 2px solid @white;
        border-radius: 10%;
        width: @size;
        height: @size;
        opacity: 0;
        -webkit-transition: opacity 1s ease-in;
                transition: opacity 1s ease-in;

        &-link {
            @arrow-width: 3.1em;
            z-index: 0;
            margin-top: 1em;
            left: calc(~"50% - " @arrow-width/2);
            width: @arrow-width;
            position: absolute;
            display: block;
        }
    }

    .fadein {
        opacity: 1;
    }
    .linkvisible {
        z-index: 4;
    }

    // general about styles
    #about {
        height: 100vh;
        background: @black;
        color: @white;
    }

    .section {
        text-align: center;
        height: 50vh;
        &:first-child > .columns {
            margin-top: 3em;
        }
    }

    // ring
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

    // decals
    .decal-container {
        position: relative;
        & > p {
            margin: 2em;
        }
    }

    .left-decal, .right-decal {
        position: absolute;
        width: 3em;
        height: 3em;
    }
    .left-decal {
        border-top: 2px solid @white;
        border-left: 2px solid @white;
    }
    .right-decal {
        border-right: 2px solid @white;
        border-bottom: 2px solid @white;
        right: 0;
        bottom: 0;
    }
</style>

<template>
    <section id="about">
        <a href="#" class="arrow-link" v-scroll-to="'#app'" v-bind:class="{ linkvisible: arrowDisplayed }">
            <div class="arrow" v-bind:class="{ fadein: arrowDisplayed }"></div>
        </a>
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
                <div class="twelve columns decal-container">
                    <div class="left-decal"></div>
                    <p>
                        Lorem ipsum dolor sit amet, sit vidisse accusamus in, te vix purto dicunt. Id option virtute reprehendunt usu, ut pro habemus alienum. Te nec munere soleat, ei quis indoctum reprimique pri. Ne sed percipit petentium delicatissimi, no mel sumo perpetua, ex mundi noster scaevola per.
                    </p>
                    <div class="right-decal"></div>
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
                    }
                }
            },
            displayArrow: function () {
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