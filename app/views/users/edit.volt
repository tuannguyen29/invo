{{ content() }}

{{ form("users/update", 'role': 'form') }}

    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("users", "&larr; Go Back") }}
        </li>
        <li class="pull-right">
            {{ submit_button("Save", "class": "btn btn-success") }}
        </li>
    </ul>

    <h2>Edit User</h2>

    <fieldset>

    {% for element in form %}
        {% if is_a(element, 'Phalcon\Forms\Element\Hidden') %}
    {{ element }}
        {% else %}
    <div class="form-group">
        {{ element.label(['class': 'control-label']) }}
        <div class="controls">
            {{ element.render(['class': 'form-control']) }}
        </div>
    </div>
        {% endif %}
    {% endfor %}

    </fieldset>

</form>
