<template>
    <div class="col-md-12 mb-3 contenedor_link_examen">
        <div class="row">
            <div
                class="col-md-12"
                v-if="listExamenes.length > 0"
                v-for="item in listExamenes"
            >
                <div class="card">
                    <div class="card-body">
                        <div class="row fila_examen">
                            <div class="col-md-12">
                                <p class="">
                                    <strong>Código de examen: </strong
                                    >{{ item.id }}
                                </p>
                                <p class="">
                                    <strong>Total preguntas: </strong
                                    >{{ item.total_preguntas }}
                                </p>
                            </div>
                            <div class="col-md-3 mb-0">
                                <router-link
                                    :to="{
                                        name: 'examen_nivelacions.realizar_examen',
                                        params: {
                                            id: item.id,
                                        },
                                    }"
                                    class="btn btn-sm btn-success btn-flat btn-block"
                                >
                                    <i class="fa fa-clipboard-list"></i>
                                    Realizar examen
                                </router-link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12" v-if="listExamenes.length == 0">
                <div class="card">
                    <div class="card-body">
                        <h4 class="w-100 text-center font-weight-bold text-md">
                            SIN RECURSOS AÚN
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: {
        curso_id: {
            type: Number,
            default: 0,
            requred: true,
        },
    },
    data() {
        return {
            listExamenes: [],
            oCurso: null,
        };
    },
    mounted() {
        this.getExamenesCurso();
    },
    methods: {
        getExamenesCurso() {
            axios
                .get(
                    main_url +
                        "/admin/examen_nivelacions/getExamenesCurso/" +
                        this.curso_id
                )
                .then((response) => {
                    this.oCurso = response.data;
                    this.listExamenes = this.oCurso.examen_nivelacions;
                });
        },
    },
};
</script>
<style>
.contenedor_link_examen .fila_examen {
    position: relative;
}
.contenedor_link_examen .fecha_hora {
    position: absolute;
    right: 0px;
    top: 0px;
    font-size: 0.75em;
}
</style>
