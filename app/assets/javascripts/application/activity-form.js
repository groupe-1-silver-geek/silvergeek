window.activityForm = {
    init: function () {
        "use strict";
        this.form = document.querySelector('#js-activity-form');
        if (!this.form) {
            return;
        }
        this.structureInput = this.form.querySelector('#activity_structure_id');
        this.structureInput.addEventListener('change', this.onStructureChange.bind(this));
        this.seniorItems = this.form.querySelectorAll('.activity_senior_ids .items-center');
        this.onStructureChange();
    },

    onStructureChange: function () {
        "use strict";
        var structureId = this.structureInput.value,
            seniorCheckbox,
            i;

        for (i = 0; i < this.seniorItems.length; i += 1) {
            seniorCheckbox = this.seniorItems[i].querySelector('input[type="checkbox"]');
            if (seniorCheckbox.dataset.structure === structureId) {
                // Même structure, on affiche
                this.seniorItems[i].classList.remove('hidden');
                seniorCheckbox.removeAttribute('disabled');
            } else {
                // Structure différente, on cache
                this.seniorItems[i].classList.add('hidden');
                seniorCheckbox.setAttribute('disabled', 'disabled');
            }
        }
    },

    invoke: function () {
        "use strict";
        return {
            init: this.init.bind(this)
        }
    }
};

window.addEventListener('DOMContentLoaded', function () {
    "use strict";
    window.activityForm.init();
});
