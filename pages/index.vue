<template>
  <b-container class="my-3">
    <b-row align-v="center">
      <b-col cols="12" class="border p-3 bg-light">
        <!-- Title -->
        <b-col cols="12" class="text-center mb-2">
          <h3>Basic Statistic Analysis</h3>
        </b-col>
        <b-row cols="12">
          <b-col cols="6">
            <ChartBar
              :options="chartOptions"
              :height="200"
              :chart-data="data()"
            />
          </b-col>
          <b-col cols="6">
            <ChartPie :height="200" :chart-data="data()" />
          </b-col>
        </b-row>
        <b-row cols="12" class="mt-2">
          <b-col cols="6">
            <FrequencyTable :data="tableData" />
          </b-col>
          <b-col cols="6">
            <StatisticValue :data="tableData" />
          </b-col>
        </b-row>
      </b-col>
    </b-row>
  </b-container>
</template>

<script>
import ChartPie from '~/components/ChartPie.vue'
import ChartBar from '~/components/ChartBar.vue'
import data from '~/static/data.json'
import FrequencyTable from '~/components/FrequencyTable.vue'
import StatisticValue from '~/components/StatisticValue.vue'

export default {
  components: { ChartPie, ChartBar, FrequencyTable, StatisticValue },
  data() {
    return {
      chartOptions: {
        legend: {
          display: false,
        },
      },
    }
  },
  computed: {
    tableData: () => {
      const headers = data.labels || []
      const content = data.datasets[0]?.data || []
      const newData = []
      for (let i = 0; i < headers.length; i++) {
        newData.push({
          key: headers[i],
          value: content[i],
        })
      }
      return newData
    },
  },
  methods: {
    data() {
      return data
    },
  },
}
</script>
