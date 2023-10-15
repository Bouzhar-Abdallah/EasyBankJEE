
    <form id="searchForm" method="POST" action="http://localhost:8080/easybankjee/employers">
        <input type="hidden" name="_METHOD" value="search"/>


    <div class="search-box">
        <button type="button" class="btn-search">
            <svg class="fas fa-search" aria-hidden="true" xmlns="http://www.w3.org/2000/svg"
                 fill="none" viewBox="0 0 20 20">
                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                      d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
            </svg>
        </button>
        <input type="text" class="input-search" placeholder="Matricule to Search..." name="matricule">
        <button style="display: none" type="submit">Search</button>

    </div>
    </form>
