postCards = document.querySelectorAll('.post-card')
button = document.querySelector('.submit-btn')

postCards.forEach(card => card.addEventListener('mouseenter', handleHover))

postCards.forEach(card => card.addEventListener('mouseleave', handleExit))

function handleHover(event) {
    let postCard = event.target
    changeDiv(postCard, "darkslategrey", 'black')
}

function handleExit(event) {
    let postCard = event.target
    changeDiv(postCard, "lightgrey", '#b2b0b0')
}

function changeDiv(target, borderColor, fontColor) {

    let border = `1px solid ${borderColor}`

    postCard = target
    sportP = postCard.children[0]
    postTextDiv = postCard.children[2]
    postInfo = postTextDiv.children[0]
    if (postInfo) {
        diffP = postInfo.children[0]
        locP = postInfo.children[1]
        
        diffP.style.color = fontColor
        locP.style.color = fontColor
        postInfo.style.borderRight = border
        postTextDiv.style.borderTop = border
    } else {
        paras = postCard.children
        for (let p of paras) {
            p.style.color = fontColor
        }
    }
    
    postCard.style.border = border
    sportP.style.color = fontColor
}