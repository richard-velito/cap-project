const cds = require('@sap/cds')

class ProjectService extends cds.ApplicationService { 
    
    init() {
        const { Projects, Items } = cds.entities ('sap.demo.project');

        this.after('READ', 'ProjectList', (projects, req) => {
            return Promise.all(projects.map(async project => {
              const items = await cds.transaction(req).run(
                SELECT `count(1) as qtyOfItems` .from(Items) .where({ project_ID: project.ID })
              )
              project.qtyOfItems = items[0].qtyOfItems;
            }));
        });

        return super.init();
    }
}

module.exports = { ProjectService }