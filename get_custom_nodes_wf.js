//Past this code in the console of the web dev tools once you have loaded your wf in ComfyUI
//It will retrieve you a list of all the custom nodes used in your workflow

const nodesInWorkflow = app.graph._nodes.map((node) => node.type)
fetch('http://localhost:8189/api/object_info') //add your local port
  .then((response) => {
    return response.json()
  })
  .then((data) => {
    const nodeModules = new Set()
    nodesInWorkflow.forEach((nodeType) => {
      if (data[nodeType]?.name === nodeType && data[nodeType].python_module) {
        const [namespace, ...rest] = data[nodeType].python_module.split('.')
        if (namespace === 'custom_nodes') {
          nodeModules.add(rest.join('.'))
        }
      }
    })
    console.log(`[${Array.from(nodeModules)}]`)
  })
  .catch((error) => console.error('Error:', error))