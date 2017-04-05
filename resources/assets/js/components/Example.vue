<template>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <textarea v-model="text" class="form-control" rows="3"></textarea>

                <div class="info-text">Click on the field to copy the text to your clipboard:</div>

                <textarea id="clipboard-1" v-model="upSideDown" :data-clipboard-text="upSideDown" class="form-control" rows="3" disabled></textarea>
                <textarea id="clipboard-2" v-model="putBack" :data-clipboard-text="putBack" class="form-control" rows="3" v-if="addTrowGuy" disabled></textarea>

                <div id="buttons">
                    <button class="btn btn-default" @click="reverse = !reverse">{{ reverseMsg }}</button>
                    <button class="btn btn-default" @click="addTrowGuy = !addTrowGuy">{{ addTrowGuyMsg }}</button>
                </div>
            </div>
        </div>
    </div>
</template>

<style>
    .info-text {
        margin-top: 15px;
        margin-bottom: 15px;
    }

    #buttons {
        margin-top: 15px;
    }

    #clipboard-2 {
        margin-top: 15px;
    }
</style>

<script>
    export default {
        mounted() {
            console.log('Component mounted.');

            var clipboard1 = new Clipboard('#clipboard-1');
            var clipboard2 = new Clipboard('#clipboard-2');
        },
        data() {
            return {
                text: '',
                reverse: true,
                addTrowGuy: false
            }
        },
        methods: {
            reverseTxt: function(txt) {
                return txt.split('').reverse().join('')
            }
        },
        computed: {
            putBack() {
                return this.text + " ノ( ゜-゜ノ)";
            },
            upSideDown() {
                let retVal = this.text;

                retVal = retVal
                // uppercase
                        .split('A').join('Ɐ')
                        .split('B').join('ᗺ')
                        .split('C').join('Ɔ')
                        .split('D').join('ᗡ')
                        .split('E').join('Ǝ')
                        .split('F').join('ᖵ')
                        .split('G').join('⅁')
                        .split('H').join('H')
                        .split('I').join('I')
                        .split('J').join('ᒋ')
                        .split('K').join('⋊')
                        .split('L').join('Ꞁ')
                        .split('M').join('W')
                        .split('N').join('N')
                        .split('O').join('O')
                        .split('P').join('Ԁ')
                        .split('Q').join('Ꝺ')
                        .split('R').join('ᴚ')
                        .split('S').join('S')
                        .split('T').join('⊥')
                        .split('U').join('∩')
                        .split('V').join('Ʌ')
                        .split('W').join('M')
                        .split('X').join('X')
                        .split('Y').join('⅄')
                        .split('Z').join('Z')

                        // lowercase
                        .split('a').join('ɐ')
                        .split('b').join('q')
                        .split('c').join('ɔ')
                        .split('d').join('p')
                        .split('e').join('ǝ')
                        .split('f').join('ɟ')
                        .split('g').join('ƃ')
                        .split('h').join('ɥ')
                        .split('i').join('ᴉ')
                        .split('j').join('ɾ')
                        .split('k').join('ʞ')
                        .split('l').join('ꞁ')
                        .split('m').join('ɯ')
                        .split('n').join('u')
                        .split('o').join('o')
                        .split('p').join('d')
                        .split('q').join('b')
                        .split('r').join('ɹ')
                        .split('s').join('s')
                        .split('t').join('ʇ')
                        .split('u').join('n')
                        .split('v').join('ʌ')
                        .split('w').join('ʍ')
                        .split('x').join('x')
                        .split('y').join('ʎ')
                        .split('z').join('z')

                        // numbers
                        .split('1').join('І')
                        .split('2').join('ᘔ')
                        .split('3').join('Ɛ')
                        .split('4').join('ᔭ')
                        .split('5').join('5')
                        .split('6').join('9')
                        .split('7').join('Ɫ')
                        .split('8').join('8')
                        .split('9').join('6')
                        .split('0').join('0')

                        // special chars
                        .split('.').join('˙')
                        .split(',').join('\'')
                        .split('\'').join(',')
                        .split('"').join(',,')
                        .split('`').join(',')
                        .split('<').join('>')
                        .split('>').join('<')
                        .split('∴').join('∵')
                        .split('&').join('⅋')
                        .split('@').join('@')
                        .split('~').join('~')
                        .split('_').join('‾')
                        .split('?').join('¿')
                        .split('!').join('¡')
                        .split('[').join(']')
                        .split(']').join('[')
                        .split('(').join(')')
                        .split(')').join('(')
                        .split('{').join('}')
                        .split('}').join('{');

                if (this.reverse) {
                    retVal = this.reverseTxt(retVal);
                }

                if (this.addTrowGuy) {
                    retVal = "(╯°□°)╯︵ " + retVal;
                }

                return retVal;
            },
            reverseMsg() {
                if (!this.reverse) {
                    return 'Reverse message';
                }

                return 'Don\'t reverse message';
            },
            addTrowGuyMsg() {
                if (!this.addTrowGuy) {
                    return 'Add: (╯°□°)╯︵ ';
                }

                return 'Remove: (╯°□°)╯︵ ';
            }
        }
    }
</script>
