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
        height: auto;

        &:first-child > .columns {
            margin-top: 3.5em;
        }
    }

    // ring
    @img-size: 120px;
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
            margin-top: calc(@diameter/2 ~" - " @img-size/2);
            opacity: 0.85;
        }
        & img:hover {
            opacity: 0.463;
        }
    }

    @media (@mediumQuery) {
        .ring {
            @query-diameter: @diameter * 0.8;
            font-size: 3.75em;
            height: @query-diameter;
            width: @query-diameter;
            line-height: @query-diameter;

            & img {
                margin-top: calc(@query-diameter/2 ~" - " @img-size/2);
            }
        }
    }

    @media (@xSmallQuery) {
        .ring {
            @query-diameter: @diameter * 0.65;
            font-size: 2.5em;
            height: @query-diameter;
            width: @query-diameter;
            line-height: @query-diameter;

            & img {
                margin-top: calc(@query-diameter/2 ~" - " @img-size/4);
                height: @img-size * 0.5;
                width: @img-size * 0.5;
            }
        }
        .link-section > .columns {
            width: 33%;
        }
        .container {
            padding: 0 10px;
        }
        .about-me-info > p:last-child {
            display: none;
        }
    }

    a.white {
        color: @white;
        text-decoration: none;
    }

    a.white:hover {
        color: @grey;
    }

    .linkedin {
        width: @img-size;
        height: @img-size;
    }

    // about me text
    .about-me-info > p {
        margin-bottom: 0.5rem;

        &:last-child {
            margin-bottom: 0rem;
        }
    }

    // decals
    .decal-container {
        position: relative;
        margin-top: 1.5em;

        & > .about-me-info {
            margin: 2em;
        }
    }
    @media (@smallQuery) {
        .decal-container > .about-me-info {
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
            <div class="row section link-section">
                <div class="four columns">
                    <a class="white" href="media/resume.pdf" target="_blank">
                        <div class="resume ring">CV</div>
                    </a>
                </div>
                <div class="four columns u-pull-right">
                    <div class="ring">
                        <a href="https://www.linkedin.com/in/alex-mccallum-341949149/">
                            <img class="linkedin" src="media/linkedin.png" alt="LinkedIn">
                        </a>
                    </div>
                </div>
                <div class="four columns u-pull-right">
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
                        <div class="about-me-info">
                            <p>
                                My name is Alex McCallum, I am software developer from Halifax NS.
                                I am currently a 4<sup>th</sup> year student at Dalhousie University majoring in Computer science.
                                I am a passionate software developer curious about all aspects of computer science.
                           </p>
                            <p>
                                At Dalhousie I partake in a wide variety of events put on by Dalhousie societies
                                I regular attend game jams and hackathons put on by the Dalhousie CS society.
                                I currently hold a position on Dal's Super Smash Brothers Society, a video game society where players gather to play the game competitively.
                                I enjoy improv acting through Dalhousie's improv society.
                                Beyond School and work, I enjoy the gym, yoga, playing guitar and reading.
                            </p>
                            <p>
                                More in depth info about my career me can be found in the links above.
                            </p>
                        </div>

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