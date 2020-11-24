### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ ae20dd10-2e9b-11eb-00a4-af2a633ff1bd
# I imported some packages!

begin
	using Images
	using PlutoUI
	using ImageFiltering
	
	using Statistics
	using LinearAlgebra
end

# ╔═╡ 2e088be0-2e9c-11eb-05d8-4dc23076cc29
# PRESENT!

html"<button onclick=present()>Present</button>"

# ╔═╡ 6d967e80-2e9b-11eb-15bb-a5cc9d107ad4
md"# Hello Everyone!"

# ╔═╡ af012390-2e9e-11eb-15ce-53001c125e03
md"# Paul Klee's Painting"

# ╔═╡ e064e070-2e9e-11eb-33fc-bd438e951b20
md"# Edge Detection"

# ╔═╡ ff4c6800-2e9e-11eb-1113-2d85fa50d763
md"# How does it work?"

# ╔═╡ 44a3defe-2e9f-11eb-3a77-6703c7003be5
begin	
	image_text = 
	md"""
	# What is an image?

	- A grid of coloured squares called **pixels**
	
	- Each pixel can be positioned by how far right and down it is.

	"""
	
	image_text
end

# ╔═╡ ab37f120-2e9f-11eb-1abe-9fa88e20771d
md"### On a computer, a pixel is stored as a combination of Red, Green and Blue!"

# ╔═╡ fdaf8b70-2e9f-11eb-0122-7dc9f407257e
RGB(0, 0, 0)

# ╔═╡ 2af05290-2ea0-11eb-2c27-4f940f392c8a
md"## This means that to detect an edge, we need to tell the computer how *different* the colours in the pixels are relative to the ones next to it."

# ╔═╡ 50278c30-2ea6-11eb-2aaf-dba8340ccb09
load(download("https://cdn-learn.adafruit.com/assets/assets/000/074/864/medium800/gaming_snesMario.png?1556117577"))

# ╔═╡ 49a16b60-2ea1-11eb-2361-07f5e55eed3b
md"## Where adjacent pixels have a big difference in colour, the program will draw an EDGE!"

# ╔═╡ 7862b800-2ea1-11eb-0508-699f24d58e96
md"## We have some code that can detect edges!"

# ╔═╡ e064bc90-2ea2-11eb-35bf-894d91e393b4
md"### This is the quantified difference in colour between the adjacent pixels."

# ╔═╡ 3a733db0-2ea3-11eb-0791-6150343f3c50
md"# The numbers are meaningless to us, so we turned it into an image!"

# ╔═╡ 454cafe0-2ea4-11eb-1e18-f32a5359cfd5
md"## I would rather to have a white background with black lines, so it would look better."

# ╔═╡ 0ec9a670-2ea5-11eb-38cc-15439ad8dc94
# White is the opposite of black.

function sketch(X)
	f(x) = RGB(1-x,1-x,1-x)
	map(f, X ./ maximum(X))
end

# ╔═╡ 62dffca0-2ea5-11eb-1f57-8dfd8e354d9c
md"# This is how my program helped me to do my art homework. "

# ╔═╡ 00078100-2ea7-11eb-12a0-f740602188b6
load(download("https://attachments.office.net/owa/6200%40tiffin.kingston.sch.uk/service.svc/s/GetAttachmentThumbnail?id=AAMkADNmNzM2YjFiLTgxMGMtNDRmMi1hODU4LTllYWRhMjMwZmQ4YwBGAAAAAACQxg3NrCc6RJ2LB7kVaMdwBwDF76DFm02%2FRp2ygnW7iB7CAAAAAAEMAADF76DFm02%2FRp2ygnW7iB7CAAAx7MhYAAABEgAQAMFXn%2FsYDG5Dmexpmh%2F9j0E%3D&thumbnailType=2&token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjU2MzU4ODUyMzRCOTI1MkRERTAwNTc2NkQ5RDlGMjc2NTY1RjYzRTIiLCJ0eXAiOiJKV1QiLCJ4NXQiOiJWaldJVWpTNUpTM2VBRmRtMmRueWRsWmZZLUkifQ.eyJvcmlnaW4iOiJodHRwczovL291dGxvb2sub2ZmaWNlMzY1LmNvbSIsInVjIjoiNjM3MDA4MTJkYzgyNGM4N2IxZjk3MDJlNDFmM2I2NzAiLCJzaWduaW5fc3RhdGUiOiJbXCJrbXNpXCJdIiwidmVyIjoiRXhjaGFuZ2UuQ2FsbGJhY2suVjEiLCJhcHBjdHhzZW5kZXIiOiJPd2FEb3dubG9hZEA0ZmQyMjRkNi0wOTQyLTQ1NTgtOTc2NS1kYmI0YTRmMzAzNjkiLCJpc3NyaW5nIjoiV1ciLCJhcHBjdHgiOiJ7XCJtc2V4Y2hwcm90XCI6XCJvd2FcIixcInByaW1hcnlzaWRcIjpcIlMtMS01LTIxLTQ1ODM2NzAyNS0yMDY0NTgxMTE1LTI5NTAxNzkwNzUtMzIyNjYxNDdcIixcInB1aWRcIjpcIjExNTM4MDExMTc2NTMxNDE1NTZcIixcIm9pZFwiOlwiMTRhZWViMTItMWJlNS00OGQ4LThhNjgtODE1ZWIwNzgyZGQ2XCIsXCJzY29wZVwiOlwiT3dhRG93bmxvYWRcIn0iLCJuYmYiOjE2MDYyNTgwOTIsImV4cCI6MTYwNjI1ODY5MiwiaXNzIjoiMDAwMDAwMDItMDAwMC0wZmYxLWNlMDAtMDAwMDAwMDAwMDAwQDRmZDIyNGQ2LTA5NDItNDU1OC05NzY1LWRiYjRhNGYzMDM2OSIsImF1ZCI6IjAwMDAwMDAyLTAwMDAtMGZmMS1jZTAwLTAwMDAwMDAwMDAwMC9hdHRhY2htZW50cy5vZmZpY2UubmV0QDRmZDIyNGQ2LTA5NDItNDU1OC05NzY1LWRiYjRhNGYzMDM2OSIsImhhcHAiOiJvd2EifQ.XmKZQuM31E4GwU-SjuxN9wC5TkviwCZs91AVWjDzAVR_P2J0i0AQ1pQzkWWP-YddD1IUdQgLA0tL538uLT01sOhidloFbBpP8tdiMmziYWQT_RdPYrz0MWtVmbx3Pb-IZOM_5sGUOQ8fgXhwa5uhDwWd1vSUQtcdSip9mALEODmyxWmP8lUn-1H6Sr4z4uZJuIMRRd1Dyy-L8LEmGCd6WB7f53ssOxnTIfAZrC70WjWCGcgMPUc-fMhRJEEermpsq-8V5m-j9kO8zP1p80Sf5mgDXe00nNVpjyiAouUiy3mZRdG-BiW-Tir_3hn3jkB_7COQHCy3s6rnQ9_pTk0UDw&X-OWA-CANARY=nqyakUol2U-zZ3LhNQI9XRBarSLLkNgYkGC4w319OhepvDhK1VfzxjhHvM4tOhKA_KWCd07GWSA.&owa=outlook.office365.com&scriptVer=20201116002.04&animation=true"))

# ╔═╡ bbd22660-2ea7-11eb-16f0-77f6310a9d42
md"# Thank you!"

# ╔═╡ 570a062e-2e9d-11eb-2059-0533cf4e7843
md"# The Code"

# ╔═╡ 3e34cbd0-2e9e-11eb-2664-f3a8bec1d5a5
brightness(c::AbstractRGB) = 0.3 * c.r + 0.59 * c.g + 0.11 * c.b

# ╔═╡ 5fa1ecd0-2e9e-11eb-323c-df0e31d68a63
function convolve(M, kernel)
    height, width = size(kernel)
    
    half_height = height ÷ 2
    half_width = width ÷ 2
    
    new_image = similar(M)
	
    # (i, j) loop over the original image
	m, n = size(M)
    @inbounds for i in 1:m
        for j in 1:n
            # (k, l) loop over the neighbouring pixels
			accumulator = 0 * M[1, 1]
			for k in -half_height:-half_height + height - 1
				for l in -half_width:-half_width + width - 1
					Mi = i - k
					Mj = j - l
					# First index into M
					if Mi < 1
						Mi = 1
					elseif Mi > m
						Mi = m
					end
					# Second index into M
					if Mj < 1
						Mj = 1
					elseif Mj > n
						Mj = n
					end
					
					accumulator += kernel[k, l] * M[Mi, Mj]
				end
			end
			new_image[i, j] = accumulator
        end
    end
    
    return new_image
end

# ╔═╡ d8d84f50-2e9d-11eb-161d-2dd27090d9e3
function edgeness(img)
	Sy, Sx = Kernel.sobel()
	b = brightness.(img)

	∇y = convolve(b, Sy)
	∇x = convolve(b, Sx)

	sqrt.(∇x.^2 + ∇y.^2)
end

# ╔═╡ b053b0b0-2e9d-11eb-07cd-8d114ddb5e3e
function hbox(x, y, gap=16; sy=size(y), sx=size(x))
	w,h = (max(sx[1], sy[1]),
		   gap + sx[2] + sy[2])
	
	slate = fill(RGB(1,1,1), w,h)
	slate[1:size(x,1), 1:size(x,2)] .= RGB.(x)
	slate[1:size(y,1), size(x,2) + gap .+ (1:size(y,2))] .= RGB.(y)
	slate
end

# ╔═╡ 41aaf1ae-2e9c-11eb-1319-259426bd75a7
md"# Appendix"

# ╔═╡ 50481810-2e9c-11eb-16fd-8bef3d1ab1df
md"### My code is all based on the Image Processing course at MIT. The course is called MIT 18.S191. 

##### https://github.com/mitmath/18S191 "

# ╔═╡ b07e86b0-2e9c-11eb-2514-0b669595fc9b
Image = load(download("https://pbs.twimg.com/media/Djrp2IrX0AERWEG.jpg"))

# ╔═╡ f5ac2e90-2e9c-11eb-01c3-d5bf5b1660cc
Paul_Klee = Image[50:930, 255:645]

# ╔═╡ 9aba6770-2e9e-11eb-2283-53da4b8482ac
Paul_Klee

# ╔═╡ bf1c2cce-2e9d-11eb-0657-4b74740c1678
sketch(edgeness(Paul_Klee))

# ╔═╡ 8509d360-2ea4-11eb-2f3b-4921344f5ff7
hbox(Paul_Klee, sketch(edgeness(Paul_Klee)) )

# ╔═╡ f5ce6720-2e9d-11eb-3677-1b0023dc3531
# The whiter the line, the larger the difference.

begin
	edges = edgeness(Paul_Klee)
	# hbox(img, pencil(edged))
	hbox(Paul_Klee, Gray.(edgeness(Paul_Klee)) / maximum(abs.(edges)))
end

# ╔═╡ 7badcee0-2ea2-11eb-0c93-152492d79652
# The Quantified Difference!

edgeness(Paul_Klee) / maximum(abs.(edges))

# ╔═╡ 6c6b55e0-2ea4-11eb-2219-f70459970b0a
hbox(Gray.(edgeness(Paul_Klee)) / maximum(abs.(edges)), sketch(edgeness(Paul_Klee)))

# ╔═╡ Cell order:
# ╠═2e088be0-2e9c-11eb-05d8-4dc23076cc29
# ╟─6d967e80-2e9b-11eb-15bb-a5cc9d107ad4
# ╟─af012390-2e9e-11eb-15ce-53001c125e03
# ╠═9aba6770-2e9e-11eb-2283-53da4b8482ac
# ╟─e064e070-2e9e-11eb-33fc-bd438e951b20
# ╠═bf1c2cce-2e9d-11eb-0657-4b74740c1678
# ╠═8509d360-2ea4-11eb-2f3b-4921344f5ff7
# ╟─ff4c6800-2e9e-11eb-1113-2d85fa50d763
# ╟─44a3defe-2e9f-11eb-3a77-6703c7003be5
# ╟─ab37f120-2e9f-11eb-1abe-9fa88e20771d
# ╠═fdaf8b70-2e9f-11eb-0122-7dc9f407257e
# ╟─2af05290-2ea0-11eb-2c27-4f940f392c8a
# ╠═50278c30-2ea6-11eb-2aaf-dba8340ccb09
# ╟─49a16b60-2ea1-11eb-2361-07f5e55eed3b
# ╟─7862b800-2ea1-11eb-0508-699f24d58e96
# ╟─e064bc90-2ea2-11eb-35bf-894d91e393b4
# ╠═7badcee0-2ea2-11eb-0c93-152492d79652
# ╟─3a733db0-2ea3-11eb-0791-6150343f3c50
# ╠═f5ce6720-2e9d-11eb-3677-1b0023dc3531
# ╟─454cafe0-2ea4-11eb-1e18-f32a5359cfd5
# ╠═0ec9a670-2ea5-11eb-38cc-15439ad8dc94
# ╠═6c6b55e0-2ea4-11eb-2219-f70459970b0a
# ╟─62dffca0-2ea5-11eb-1f57-8dfd8e354d9c
# ╟─00078100-2ea7-11eb-12a0-f740602188b6
# ╟─bbd22660-2ea7-11eb-16f0-77f6310a9d42
# ╟─570a062e-2e9d-11eb-2059-0533cf4e7843
# ╟─3e34cbd0-2e9e-11eb-2664-f3a8bec1d5a5
# ╟─5fa1ecd0-2e9e-11eb-323c-df0e31d68a63
# ╟─d8d84f50-2e9d-11eb-161d-2dd27090d9e3
# ╟─b053b0b0-2e9d-11eb-07cd-8d114ddb5e3e
# ╟─41aaf1ae-2e9c-11eb-1319-259426bd75a7
# ╟─50481810-2e9c-11eb-16fd-8bef3d1ab1df
# ╠═ae20dd10-2e9b-11eb-00a4-af2a633ff1bd
# ╠═b07e86b0-2e9c-11eb-2514-0b669595fc9b
# ╠═f5ac2e90-2e9c-11eb-01c3-d5bf5b1660cc
