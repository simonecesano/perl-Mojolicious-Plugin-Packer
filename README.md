# Mojolicious::Plugin::Packer #

A Mojolicious plugin to pack CSS, JavaScript and HTML using
[JavaScript::Packer](https://metacpan.org/pod/JavaScript::Packer),
[HTML::Packer](https://metacpan.org/pod/HTML::Packer)
and [CSS::Packer](https://metacpan.org/pod/CSS::Packer).

in Mojolicious app:

    plugin 'Packer';

In templates:

    <style>
      %== csspack begin
      pre { padding-top: 6px; background-color: #eeeeee }
      % end
    </style>
    <body>
      %== htmlpack begin
      <%= content %><br />
      % end
    </body
    %= javascript begin
    %== jspack begin
    $(function(){
        console.log('this works');
    })
    % end
    % end




