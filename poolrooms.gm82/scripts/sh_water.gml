return shader_pixel_create_base64("
    eJxlkj9oE2EYxn/fd3d4SPFmiWDAxS6BRCpkaEPbRaQdtB51EErMHwzEXrnE/esu
    NKvicAWnZMngKBac083N9UY3d0/e77skFT84eJ/nef+/p3RR/Cmesv9id+8e8BtQ
    uigCQDAKfgEG8NACeS888MlyynKfS+4LoF0YX0tuYTnn96Pkcsvpf7jD9umgnwy7
    zGYznw0bIbq84/a4l/I/30mGSTpOULYT+dzrDkbjJB2XnKsjb/Qu7bc7Pc5GJ42T
    1xwOOmkySvrj6sPnm9UnB0cH1aM37W4vre4nb88Gw15abdYazVpzq1F7VK/XeQaB
    R5QBLeDqerHYOf35uCW8T5Rt3z7eufi+1dp8dbEt9YQPiLLrxUKwAXP18cPdb/fd
    mgx487WtJqU9UWGULW0dRpmWVaPlDHMNl8pqykA8D6zmGciNB5loymnG2TbO7Fm/
    yPrpMM8EKyKjSryuEc81scWSR4HxSgy+5Jp4TLNghafGoyj9XS3xd/qG1RUVE6x0
    wbHtUxMKn/ngiya8pjhXxGadT+ZYY2fHly/B17b/2AS23jTbld+XyEg+faOW5HD9
    y16wM93E0u+D1U4p48UuxFfuPV/uS5MbFeZZWO5L9ueT2xmW8QGFrem4O6s8sgeX
    +5b1gzyDyrmb33ITyQ8VeztCd5+igL+CVZ6a
")

/*
    SamplerState Sampler: register(s0);
    SamplerState Water;
    SamplerState Manifold;

    struct PS_INPUT {
        float4 position: POSITION0;
        float2 uv: TEXCOORD0;
        float4 color: COLOR;
    };

    struct PS_OUTPUT {
        float4 color: COLOR;
    };

    uniform float3 colorto;
    uniform float2 distort;
    uniform float2 surface;

    PS_OUTPUT main(PS_INPUT input) {
        PS_OUTPUT output;

        //red channel = water depth
        float amount = input.color.r;

        //add surface offset
        input.uv.y+=surface.y;

        //noise fetch (remove scroll)
        float4 noise = tex2D(Manifold,(input.uv-float2(surface.x,surface.y))*0.5);
        float4 noise2 = tex2D(Manifold,(input.uv.yx-float2(surface.y,surface.x))*0.5);

        //calculate offset from noise
        float2 offset = float2(noise.r-0.5,noise2.r-0.5) * ((amount+0.4)/1.4) * distort;

        //background texture fetch
        float4 diffuse = tex2D(Water,input.uv+offset);

        //get luminance for fade effect                        add caustics
        float gray = dot(diffuse.rgb,float3(0.21,0.71,0.07)) + abs(noise.r-0.5+noise2.r-0.5)*-0.15;

        //wavy surface
        if ((input.uv+(offset.y-0.1*distort.y)).y<surface.y) discard;

        //apply color fade effect
        output.color = float4(lerp(diffuse.rgb+offset.r,float3(gray,gray,gray)*colorto,amount),diffuse.a);

        return output;
    }
*/
