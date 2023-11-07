<template>
    <div class="col-md-12 mt-0">
        <div class="row">
            <div class="col-md-12 pregunta_respuesta">
                <template v-if="pregunta.tipo == 'LLENADO'">
                    <p>{{ index_pregunta + 1 }}) {{ pregunta.pregunta }}</p>
                    <input
                        class="input_respuesta input_llenado"
                        :class="['pregunta_' + pregunta.id]"
                    />
                </template>
                <template v-if="pregunta.tipo == 'LLENADO INTERMEDIO'">
                    <p>
                        {{ index_pregunta + 1 }})
                        <span v-html="llenadoIntermedio"></span>
                    </p>
                </template>
                <template v-if="pregunta.tipo == 'SELECCIÓN'">
                    <p>
                        {{ index_pregunta + 1 }})
                        <span v-html="llenadoIntermedio"></span>
                        <span
                            class="cursor-pointer"
                            :class="{
                                seleccionado: valor_respuesta == item_opcion,
                            }"
                            v-for="(
                                item_opcion, index_opcion
                            ) in pregunta.array_opciones"
                            @click="registraSeleccion(item_opcion)"
                            >{{ item_opcion }}

                            <span
                                v-if="
                                    index_opcion <
                                    pregunta.array_opciones.length - 1
                                "
                                >/</span
                            ></span
                        >
                    </p>
                </template>
                <template
                    v-if="
                        pregunta.tipo ==
                            'LLENADO DOBLE INTERMEDIO CON OPCIONES' ||
                        pregunta.tipo == 'LLENADO INTERMEDIO CON OPCIONES'
                    "
                >
                    <p>
                        {{ index_pregunta + 1 }})
                        <span v-html="llenadoIntermedio"></span>
                    </p>
                    <ul style="list-style: none; padding-left: 20px">
                        <li
                            v-for="(
                                item_opcion, index_opcion
                            ) in pregunta.array_opciones"
                            :class="{
                                seleccionado: valor_respuesta == item_opcion,
                            }"
                        >
                            <span
                                class="cursor-pointer"
                                @click="registraSeleccion(item_opcion)"
                            >
                                {{ txt_opciones[index_opcion] }}
                                {{ item_opcion }}
                            </span>
                        </li>
                    </ul>
                </template>
                <template v-if="pregunta.tipo == 'ELIGE UNA OPCIÓN'">
                    <p>
                        {{ index_pregunta + 1 }})
                        <span>{{ pregunta.pregunta }}</span>
                    </p>
                    <ul style="list-style: none; padding-left: 20px">
                        <li
                            v-for="(
                                item_opcion, index_opcion
                            ) in pregunta.array_opciones"
                            :class="{
                                seleccionado: valor_respuesta == item_opcion,
                            }"
                        >
                            <span
                                class="cursor-pointer"
                                @click="registraSeleccion(item_opcion)"
                            >
                                {{ txt_opciones[index_opcion] }}
                                {{ item_opcion }}
                            </span>
                        </li>
                    </ul>
                </template>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        index: {
            type: Number,
            default: 0,
        },
        index_pregunta: {
            type: Number,
            default: 0,
        },
        pregunta: {
            type: Object,
            default: {
                id: 0,
                examen_enunciado_id: 0,
                pregunta: "",
                repuesta: "",
                tipo: "LLENADO",
                opciones: "",
                array_opciones: [],
            },
        },
        errors_form: {
            type: [],
            default: [],
        },
    },
    watch: {
        pregunta: {
            handler(newPregunta, oldPregunta) {
                this.tipo_pregunta = newPregunta.tipo;
            },
            deep: true, // Observa propiedades anidadas
        },
        errors_form: {
            handler(newerrors, olderrors) {
                this.errors = newerrors;
            },
            deep: true, // Observa propiedades anidadas
        },
    },
    computed: {
        llenadoIntermedio() {
            let readonly = "";
            if (
                this.pregunta.tipo == "SELECCIÓN" ||
                this.pregunta.tipo == "LLENADO DOBLE INTERMEDIO CON OPCIONES" ||
                this.pregunta.tipo == "LLENADO INTERMEDIO CON OPCIONES"
            ) {
                readonly = "readonly";
            }
            let input_respuesta = `<input class="input_respuesta input_llenado_intermedio pregunta_${this.pregunta.id}" ${readonly}/>`;

            return this.pregunta.pregunta.replace(/_+/g, input_respuesta);
        },
    },
    data() {
        return {
            tipo_pregunta: this.pregunta.tipo,
            errors: this.errors_form,
            txt_opciones: ["A)", "B)", "C)", "D)", "E)", "F)", "G)"],
            valor_respuesta: "",
        };
    },
    mounted() {
        let self = this;
        $(".pregunta_" + this.pregunta.id).on("change keyup", function () {
            self.asignaRepuestaSeleccion($(this).val());
        });
    },
    methods: {
        registraSeleccion(valor) {
            $(".pregunta_" + this.pregunta.id).val(valor);
            this.valor_respuesta = valor;
            this.asignaRepuestaSeleccion(this.valor_respuesta);
        },

        asignaRepuestaSeleccion(valor) {
            this.$emit(
                "chageRespuesta",
                this.pregunta.examen_enunciado_id,
                this.pregunta.id,
                valor
            );
        },
    },
};
</script>

<style>
.pregunta_respuesta .input_respuesta {
    border: none;
    border-bottom: solid 1px;
    width: 100%;
}

.pregunta_respuesta .input_llenado_intermedio {
    width: 120px;
}

.pregunta_respuesta .input_respuesta:focus,
.pregunta_respuesta .input_respuesta:target,
.pregunta_respuesta .input_respuesta:active {
    outline: none;
}

ul li.seleccionado,
span.seleccionado {
    color: var(--principal2);
    font-weight: bold;
}
</style>
