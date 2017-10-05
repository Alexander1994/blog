<style lang="less" scoped>
    @import "../../less/vars";

    // arrow
    .arrow {
        @size: 3em;
        border-left: 2px solid @white;
        border-top: 2px solid @white;
        border-radius: 10%;
        width: @size;
        height: @size;
        opacity: 0;
        .vendor(transform, rotate(45deg));
        .vendor(transition, opacity 1s ease-in);

        &:hover {
            border-color: @grey;
        }

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
            margin-top: 5em;
        }
    }

    @media (@xSmallQuery) {
        .section:first-child > .columns:first-child {
            margin-top: 3em;
        }
        .section:first-child > .columns:nth-child(2) {
            margin-top: 1em;
        }
    }

    // ring
    @github-img-size: 120px;
    @diameter: 3em;
    .ring {
        border: 2px solid @white;
        border-radius: 50%;
        font-size: 5em;
        height: @diameter;
        width: @diameter;
        margin: 0 auto;
        line-height: @diameter;

        & img {
            margin-top: calc(@diameter/2 ~" - " @github-img-size/2);
            opacity: 0.85;
        }
        & img:hover {
            opacity: 0.463;
        }
    }

    @media (@smallQuery) {
        .ring {
            @query-diameter: @diameter * 0.8;
            font-size: 3.75em;
            height: @query-diameter;
            width: @query-diameter;
            line-height: @query-diameter;

            & img {
                margin-top: calc(@query-diameter/2 ~" - " @github-img-size/2);
            }
        }
    }

    a.white {
        color: @white;
        text-decoration: none;
    }

    a.white:hover {
        color: @grey;
    }

    // decals
    .decal-container {
        position: relative;
        & > p {
            margin: 2em;
        }
    }
    @media (@smallQuery) {
        .decal-container > p {
            margin: 1em;
        }
    }
    @media (@xSmallQuery) {
        .decal-container {
            margin-top: 1rem;
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
        <a href="#" class="arrow-link" v-scroll-to="'#app'" :class="{ linkvisible: arrowDisplayed }">
            <div class="arrow" :class="{ fadein: arrowDisplayed }"></div>
        </a>
        <div class="container">
            <div class="row section">
                <div class="five columns">
                    <a class="white" href="media/resume.pdf" target="_blank">
                        <div class="resume ring">CV</div>
                    </a>
                </div>
                <div class="five columns u-pull-right">
                    <div class="ring">
                        <a href="https://github.com/Alexander1994">
                            <img src="media/GitHub-Mark-Light-120px-plus.png" alt="Github">
                        </a>
                    </div>
                </div>
            </div>
            <div class="row section">
                <div class="twelve columns decal-container">
                    <div class="left-decal"></div>
                    <p>
                        My name is Alex McCallum, I am software developer from Halifax NS.
                        I am currently a 4<sup>th</sup> year student at Dalhousie University majoring in Computer science.
                        My passion is for all things web related from the database to the view.
                        More in depth info about me can be found in the links above.
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