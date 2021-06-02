<template>
  <b-list-group class="text-center">
    <!-- Title -->
    <b-list-group-item variant="info"> Statistic value </b-list-group-item>
    <!-- Header -->
    <b-list-group-item variant="success">
      <b-row cols="12">
        <b-col cols="6" class="border-right">Key</b-col>
        <b-col cols="6">Value</b-col>
      </b-row>
    </b-list-group-item>
    <b-list-group-item v-for="option in options" :key="option.key">
      <!-- Content -->
      <b-row cols="12">
        <b-col cols="6" class="border-right">{{ option.key }}</b-col>
        <b-col cols="6">{{ option.fn(data) }}</b-col>
      </b-row>
    </b-list-group-item>
  </b-list-group>
</template>

<script>
export default {
  name: 'StatistValue',
  props: {
    data: {
      type: Array,
      default() {
        return []
      },
    },
  },
  data() {
    return {
      options: [
        {
          key: 'Average',
          fn(data = []) {
            let sum = 0
            let length = 0
            data.forEach(({ key, value }) => {
              sum += parseInt(key) * value
              length += value
            })
            return sum / length
          },
        },
        {
          key: 'Median',
          fn(data = []) {
            let length = 0
            data.forEach(({ value }) => {
              length += value
            })
            length = length / 2
            let val = 0
            let ret = 0
            data.forEach(({ key, value }) => {
              val += value
              // eslint-disable-next-line no-console
              console.log(val)
              if (val >= length && ret === 0) ret = parseInt(key)
            })
            return ret
          },
        },
        {
          key: 'Trend',
          fn(data = []) {
            let max = data[0]?.value || 0
            let index = 0
            data.forEach(({ value }, i) => {
              if (value > max) {
                max = value
                index = i
              }
            })
            return data[index]?.key || 0
          },
        },
        {
          key: 'Variance',
          fn(data = []) {
            let avg = 0
            // Average
            let sum = 0
            let length = 0
            data.forEach(({ key, value }) => {
              sum += parseInt(key) * value
              length += value
            })
            avg = sum / length
            // Variance
            let values = 0
            data.forEach(({ key, value }) => {
              values += (key * value - avg) ^ 2
            })
            return parseFloat(values / data.length).toFixed(2)
          },
        },
        {
          key: 'Standard deviation',
          fn(data = []) {
            let avg = 0
            // Average
            let sum = 0
            let length = 0
            data.forEach(({ key, value }) => {
              sum += parseInt(key) * value
              length += value
            })
            avg = sum / length
            // Variance
            let values = 0
            data.forEach(({ key, value }) => {
              values += (key * value - avg) ^ 2
            })
            const variance = values / data.length
            // Standard deviation
            return parseFloat(Math.sqrt(variance)).toFixed(2)
          },
        },
      ],
    }
  },
}
</script>
