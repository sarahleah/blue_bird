postCards = document.querySelectorAll('.post-card')


postCards.forEach(card => card.addEventListener('mouseenter', handleHover))

postCards.forEach(card => card.addEventListener('mouseleave', handleExit))

function handleHover(event) {
    postCard = event.target
    sportP = postCard.children[0]
    postTextDiv = postCard.children[2]
    postInfo = postTextDiv.children[0]
    if (postInfo) {
        diffP = postInfo.children[0]
        locP = postInfo.children[1]

        diffP.style.color = 'black'
        locP.style.color = 'black'
        postInfo.style.borderRight = '1px solid darkslategrey'
        postTextDiv.style.borderTop = '1px solid darkslategrey'
    } else {
        paras = postCard.children
        for (let p of paras) {
            p.style.color = 'black'
        }
    }
    
    postCard.style.border = '1px solid darkslategrey'
    sportP.style.color = 'black'
    
}

function handleExit(event) {
    postCard = event.target
    sportP = postCard.children[0]
    postTextDiv = postCard.children[2]
    postInfo = postTextDiv.children[0]
    if (postInfo) {
        diffP = postInfo.children[0]
        locP = postInfo.children[1]

        diffP.style.color = '#b2b0b0'
        locP.style.color = '#b2b0b0'
        postInfo.style.borderRight = '1px solid lightgrey'
        postTextDiv.style.borderTop = '1px solid lightgrey'
    } else {
        paras = postCard.children
        for (let p of paras) {
            p.style.color = 'grey'
        }
    }
    
    postCard.style.border = '1px solid lightgrey'
    sportP.style.color = '#b2b0b0'

}
