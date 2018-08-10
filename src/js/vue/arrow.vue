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
    .black {
        border-color: @black;
    }
    .down {
        border-right: 2px solid @white;
        border-bottom: 2px solid @white;
        border-left: 0;
        border-top: 0;
    }
    .fadein {
        opacity: 1;
    }
    .linkvisible {
        z-index: 4;
    }
</style>

<template>
    <a href="#" class="arrow-link" v-scroll-to="'#' + scrollTo+''" :class="{ linkvisible: arrowDisplayed }">
        <div class="arrow" :class="{ fadein: arrowDisplayed, down: down==='true', black:black==='true' }"></div>
    </a>
</template>

<script>
    // Color, up / down, scrollTo
    module.exports = {
        name: 'arrow',
        props: ['down', 'black', 'scrollTo'],
        data: function () {
            return {
                scrolledTo: false,
                arrowTimerStarted: false,
                arrowDisplayed: false,
                arrowTimeout: undefined,
                offsetTop: 0
            };
        },
        methods: { // TODO add Lodash debounce function
            handleScroll: function () {
                this.scrolledTo = window.scrollY < this.offsetTop && (window.scrollY + window.innerHeight) > this.offsetTop;

                if (this.scrolledTo &&  !this.arrowTimerStarted && !this.arrowDisplayed) {
                    this.arrowTimerStarted = true;
                    this.arrowTimeout = setTimeout(this.displayArrow, 3000);
                }
                if (!this.scrolledTo) {
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
            },
            calcOffSetTop: function () {
                let yPosition = 0;
                let element = this.$el;

                while(element) {
                    yPosition += (element.offsetTop - element.scrollTop + element.clientTop);
                    element = element.offsetParent;
                }
                return yPosition;
            }
        },
        mounted: function () {
            this.offsetTop = this.calcOffSetTop();
        },
        created: function () {
            window.addEventListener('scroll', this.handleScroll);
        },
        destroyed: function () {
            window.removeEventListener('scroll', this.handleScroll);
        }
    }

</script>