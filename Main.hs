import Text.Printf

type Point     = (Float,Float)
type Rect      = (Point,Float,Float)
type Circle    = (Point,Float)

defaultPalette :: Int -> [(Int,Int,Int)]
defaultPalette n = take n $ cycle [(7, 59, 58),(11, 110, 79),(8, 160, 69),(107, 191, 89),(222, 244, 198)]

-------------------------------------------------------------------------------
-- Geração de retângulos em suas posições
-------------------------------------------------------------------------------

-- Gera lista de retangulos concentricos
genRectsInLoop :: Int -> Float -> Float -> [Rect]
genRectsInLoop n w h  = [((250, 250), (w-(gap*m)*w), (h-(gap*m)*h)) | m <- [0..fromIntegral (n)]]
  where gap = 0.01

-- Gera lista de círculos concentricos
genCirclesInLoop :: Int -> Float -> [Circle]
genCirclesInLoop n r  = [((750, 750), (r-(gap*m)*r)) | m <- [0..fromIntegral (n)]]
  where gap = 0.01

-------------------------------------------------------------------------------
-- Strings SVG
-------------------------------------------------------------------------------

-- Gera string representando retângulo SVG 
svgRect :: Rect -> String -> String 
svgRect ((x,y),w,h) style = 
  printf "<rect x='%.3f' y='%.3f' width='%.2f' height='%.2f' style='%s' />\n" x y w h style

svgCircle :: Circle -> String -> String 
svgCircle ((x,y),r) style = 
  printf "<circle cx='%.3f' cy='%.3f' r='%.2f' style='%s' />\n" x y r style

-- String inicial do SVG
svgBegin :: Float -> Float -> String
svgBegin w h = printf "<svg width='%.2f' height='%.2f' xmlns='http://www.w3.org/2000/svg'>\n" w h 

-- String final do SVG
svgEnd :: String
svgEnd = "</svg>"

-- Gera string com atributos de estilo para uma dada cor
svgStyle :: (Int,Int,Int) -> String
svgStyle (r,g,b) = printf "fill:rgb(%d,%d,%d);" r g b

-- Gera strings SVG para uma dada lista de figuras e seus atributos de estilo
svgElements :: (a -> String -> String) -> [a] -> [String] -> String
svgElements func elements styles = concat $ zipWith func elements styles

-------------------------------------------------------------------------------
-- Funções principais
-------------------------------------------------------------------------------

-- Gera a imagem de círculos concentricos
concentricCircles :: Int -> Float -> IO ()
concentricCircles ncircles width = do
  writeFile "image.svg" $ svgstrs
  where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
        svgfigs = svgElements svgCircle circles (map svgStyle palette)
        circles = genCirclesInLoop ncircles width
        palette = defaultPalette ncircles
        (w,h) = (1500,1500) -- width,height da imagem SVG

-- Gera a imagem de retangulos concentricos
concentricRectangles :: Int -> Float -> Float -> IO ()
concentricRectangles nrects width height = do
  writeFile "image.svg" $ svgstrs
  where svgstrs = svgBegin w h ++ svgfigs ++ svgEnd
        svgfigs = svgElements svgRect rects (map svgStyle palette)
        rects = genRectsInLoop nrects width height
        palette = defaultPalette nrects
        (w,h) = (1500,1500) -- width,height da imagem SVG


-- Função Principal: Pega a opção passada e gera a imagem correspondente
generate :: Int -> Int -> Float -> Float -> IO()
generate option numElements width height = if option == 1 then concentricCircles numElements width else concentricRectangles numElements width height