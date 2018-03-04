module ApplicationHelper

    def profileCardMaker(title, data)
        data = '<p class="lead">
        <h5>' + title + '</h5>
        <div class="card">
            <div class="card-body">' + data + '</div>
        </div>
        <p>'
        data.html_safe
    end

end
